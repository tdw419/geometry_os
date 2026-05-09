; DESCRIPTION: Composite: Sets a single purple pixel at (335, 71) then Renders a blue disk with center (295, 109) and radius 65.
; PLAN: r0=335(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=109(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 109
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
