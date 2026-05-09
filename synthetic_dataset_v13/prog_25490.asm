; DESCRIPTION: Draws a orange rectangle at (375, 51) with width 88 and height 73.
; PLAN: r0=375(x), r1=51(y), r2=88(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 51
LDI r2, 88
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
