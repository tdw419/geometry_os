; DESCRIPTION: Composite: Sets a single blue pixel at (353, 114) then Renders a white disk with center (339, 128) and radius 38.
; PLAN: r0=353(x), r1=114(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=128(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 353
LDI r1, 114
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 128
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
