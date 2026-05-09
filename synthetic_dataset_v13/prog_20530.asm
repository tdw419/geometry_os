; DESCRIPTION: Composite: Sets a single blue pixel at (402, 125) then Places a orange circle of radius 75 at center (155, 79).
; PLAN: r0=402(x), r1=125(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=79(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 125
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 155
LDI r6, 79
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
