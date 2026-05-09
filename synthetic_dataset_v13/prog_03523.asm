; DESCRIPTION: Draws a green circle centered at (253, 137) with radius 42.
; PLAN: r0=253(x), r1=137(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 137
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
