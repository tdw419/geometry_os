; DESCRIPTION: Composite: Sets a single purple pixel at (413, 255) then Renders a blue disk with center (248, 209) and radius 41.
; PLAN: r0=413(x), r1=255(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=209(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 413
LDI r1, 255
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 209
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
