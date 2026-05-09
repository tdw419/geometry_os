; DESCRIPTION: Renders a yellow box of size 17x84 starting at (234, 64).
; PLAN: r0=234(x), r1=64(y), r2=17(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 64
LDI r2, 17
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
