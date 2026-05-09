; DESCRIPTION: Draws a red rectangle at (174, 78) with width 48 and height 74.
; PLAN: r0=174(x), r1=78(y), r2=48(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 78
LDI r2, 48
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
