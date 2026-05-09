; DESCRIPTION: Composite: Sets a single purple pixel at (10, 136) then Renders a green disk with center (334, 50) and radius 35.
; PLAN: r0=10(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=50(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 10
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 334
LDI r6, 50
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
