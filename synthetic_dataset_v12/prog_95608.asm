; DESCRIPTION: Renders a yellow box of size 31x88 starting at (347, 105).
; PLAN: r0=347(x), r1=105(y), r2=31(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 105
LDI r2, 31
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
