; DESCRIPTION: Composite: Sets a single blue pixel at (196, 17) then Renders a green disk with center (379, 136) and radius 68.
; PLAN: r0=196(x), r1=17(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=136(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 196
LDI r1, 17
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 136
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
