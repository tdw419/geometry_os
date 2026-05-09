; DESCRIPTION: Composite: Places a orange dot at position (110, 107) then Renders a purple disk with center (269, 76) and radius 73.
; PLAN: r0=110(x), r1=107(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=76(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 107
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 269
LDI r6, 76
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
