; DESCRIPTION: Draws a orange rectangle at (232, 109) with width 33 and height 51.
; PLAN: r0=232(x), r1=109(y), r2=33(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 109
LDI r2, 33
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
