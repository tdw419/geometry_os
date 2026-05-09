; DESCRIPTION: Draws a black circle centered at (36, 128) with radius 20.
; PLAN: r0=36(x), r1=128(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 128
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
