; DESCRIPTION: Composite: Sets a single green pixel at (180, 13) then Renders a blue disk with center (433, 145) and radius 55.
; PLAN: r0=180(x), r1=13(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=145(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 13
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 433
LDI r6, 145
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
