; DESCRIPTION: Composite: Places a green dot at position (356, 227) then Creates a magenta circular shape at (147, 80) with radius 23.
; PLAN: r0=356(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=80(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 147
LDI r6, 80
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
