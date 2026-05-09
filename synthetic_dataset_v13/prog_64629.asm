; DESCRIPTION: Composite: Sets a single green pixel at (170, 62) then Renders a purple disk with center (49, 108) and radius 12.
; PLAN: r0=170(x), r1=62(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=108(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 62
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 49
LDI r6, 108
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
