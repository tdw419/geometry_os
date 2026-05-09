; DESCRIPTION: Composite: Sets a single green pixel at (178, 160) then Renders a blue disk with center (160, 178) and radius 49.
; PLAN: r0=178(x), r1=160(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=178(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 178
LDI r1, 160
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 160
LDI r6, 178
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
