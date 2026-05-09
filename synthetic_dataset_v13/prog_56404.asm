; DESCRIPTION: Draws a black circle centered at (218, 64) with radius 36.
; PLAN: r0=218(x), r1=64(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 64
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
