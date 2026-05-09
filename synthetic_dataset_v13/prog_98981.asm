; DESCRIPTION: Composite: Places a magenta dot at position (402, 177) then Creates a yellow circular shape at (273, 211) with radius 13.
; PLAN: r0=402(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=211(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 211
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
