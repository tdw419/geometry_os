; DESCRIPTION: Composite: Sets a single blue pixel at (357, 103) then Draws a yellow circle centered at (272, 87) with radius 55.
; PLAN: r0=357(x), r1=103(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=87(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 103
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 87
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
