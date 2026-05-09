; DESCRIPTION: Draws a yellow rectangle at (447, 161) with width 51 and height 45.
; PLAN: r0=447(x), r1=161(y), r2=51(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 161
LDI r2, 51
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
