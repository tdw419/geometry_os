; DESCRIPTION: Draws a red rectangle at (217, 11) with width 74 and height 40.
; PLAN: r0=217(x), r1=11(y), r2=74(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 11
LDI r2, 74
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
