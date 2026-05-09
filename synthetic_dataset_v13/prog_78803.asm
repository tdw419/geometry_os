; DESCRIPTION: Composite: Places a green dot at position (166, 163) then Creates a blue circular shape at (371, 182) with radius 44.
; PLAN: r0=166(x), r1=163(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=182(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 166
LDI r1, 163
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 371
LDI r6, 182
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
