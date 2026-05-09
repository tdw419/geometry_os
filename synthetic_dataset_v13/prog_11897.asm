; DESCRIPTION: Composite: Renders a blue disk with center (246, 172) and radius 60 then Places a blue dot at position (185, 247).
; PLAN: r0=246(x), r1=172(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=247(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 246
LDI r1, 172
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 247
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
