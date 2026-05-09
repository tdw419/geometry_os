; DESCRIPTION: Composite: Sets a single blue pixel at (480, 225) then Renders a purple disk with center (414, 91) and radius 34.
; PLAN: r0=480(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=91(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 91
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
