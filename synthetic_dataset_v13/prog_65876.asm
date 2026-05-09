; DESCRIPTION: Renders a black box of size 45x110 starting at (347, 78).
; PLAN: r0=347(x), r1=78(y), r2=45(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 78
LDI r2, 45
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
