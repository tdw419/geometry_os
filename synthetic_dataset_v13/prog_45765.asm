; DESCRIPTION: Composite: Renders a purple disk with center (188, 62) and radius 49 then Places a white dot at position (293, 176).
; PLAN: r0=188(x), r1=62(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=176(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 62
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 176
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
