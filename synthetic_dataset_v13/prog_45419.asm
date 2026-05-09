; DESCRIPTION: Composite: Sets a single blue pixel at (124, 67) then Renders a green disk with center (339, 78) and radius 57.
; PLAN: r0=124(x), r1=67(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=78(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 124
LDI r1, 67
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 78
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
