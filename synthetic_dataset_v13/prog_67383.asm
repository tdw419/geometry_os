; DESCRIPTION: Composite: Renders a orange disk with center (249, 155) and radius 75 then Places a cyan dot at position (253, 129).
; PLAN: r0=249(x), r1=155(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=129(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 155
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 129
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
