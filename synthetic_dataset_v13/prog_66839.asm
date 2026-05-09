; DESCRIPTION: Composite: Sets a single red pixel at (349, 65) then Renders a magenta disk with center (486, 237) and radius 13.
; PLAN: r0=349(x), r1=65(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=486(x), r6=237(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 349
LDI r1, 65
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 486
LDI r6, 237
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
