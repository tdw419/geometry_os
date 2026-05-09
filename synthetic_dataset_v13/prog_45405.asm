; DESCRIPTION: Composite: Renders a white disk with center (438, 176) and radius 31 then Places a blue dot at position (509, 123).
; PLAN: r0=438(x), r1=176(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=509(x), r6=123(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 438
LDI r1, 176
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 509
LDI r6, 123
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
