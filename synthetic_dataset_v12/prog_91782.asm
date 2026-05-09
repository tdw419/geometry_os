; DESCRIPTION: Draws a black circle centered at (273, 75) with radius 64.
; PLAN: r0=273(x), r1=75(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 75
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
