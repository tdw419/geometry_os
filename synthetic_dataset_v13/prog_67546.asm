; DESCRIPTION: Draws a red rectangle at (275, 9) with width 74 and height 10.
; PLAN: r0=275(x), r1=9(y), r2=74(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 9
LDI r2, 74
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
