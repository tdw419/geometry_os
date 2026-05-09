; DESCRIPTION: Composite: Places a blue dot at position (483, 202) then Renders a orange disk with center (358, 66) and radius 45.
; PLAN: r0=483(x), r1=202(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=66(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 202
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 66
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
