; DESCRIPTION: Composite: Places a black dot at position (207, 130) then Creates a magenta circular shape at (269, 147) with radius 58.
; PLAN: r0=207(x), r1=130(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=147(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 207
LDI r1, 130
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 269
LDI r6, 147
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
