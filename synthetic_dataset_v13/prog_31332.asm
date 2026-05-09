; DESCRIPTION: Composite: Sets a single blue pixel at (374, 47) then Renders a yellow disk with center (162, 191) and radius 49.
; PLAN: r0=374(x), r1=47(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=191(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 47
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 191
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
