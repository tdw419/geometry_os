; DESCRIPTION: Draws a black circle centered at (128, 160) with radius 51.
; PLAN: r0=128(x), r1=160(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 160
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
