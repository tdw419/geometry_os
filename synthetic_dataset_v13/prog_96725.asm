; DESCRIPTION: Renders a yellow box of size 35x51 starting at (390, 35).
; PLAN: r0=390(x), r1=35(y), r2=35(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 35
LDI r2, 35
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
