; DESCRIPTION: Composite: Sets a single blue pixel at (114, 42) then Renders a purple disk with center (164, 22) and radius 17.
; PLAN: r0=114(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=22(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 164
LDI r6, 22
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
