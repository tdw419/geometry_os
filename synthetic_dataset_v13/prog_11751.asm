; DESCRIPTION: Composite: Places a orange dot at position (75, 137) then Renders a blue disk with center (447, 139) and radius 55.
; PLAN: r0=75(x), r1=137(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=139(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 137
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 447
LDI r6, 139
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
