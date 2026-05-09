; DESCRIPTION: Composite: Sets a single yellow pixel at (166, 152) then Renders a purple disk with center (166, 65) and radius 17.
; PLAN: r0=166(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=65(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 166
LDI r1, 152
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 166
LDI r6, 65
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
