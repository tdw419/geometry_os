; DESCRIPTION: Renders a yellow box of size 64x11 starting at (347, 181).
; PLAN: r0=347(x), r1=181(y), r2=64(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 181
LDI r2, 64
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
