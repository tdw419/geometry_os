; DESCRIPTION: Creates a magenta circular shape at (272, 137) with radius 62.
; PLAN: r0=272(x), r1=137(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 137
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
