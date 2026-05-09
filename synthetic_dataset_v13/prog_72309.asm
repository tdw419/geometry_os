; DESCRIPTION: Composite: Sets a single black pixel at (61, 149) then Renders a blue disk with center (363, 123) and radius 57.
; PLAN: r0=61(x), r1=149(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=123(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 149
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 363
LDI r6, 123
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
