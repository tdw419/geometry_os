; DESCRIPTION: Creates a magenta circular shape at (256, 137) with radius 52.
; PLAN: r0=256(x), r1=137(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 137
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
