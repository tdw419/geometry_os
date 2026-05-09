; DESCRIPTION: Composite: Renders a red disk with center (311, 85) and radius 65 then Places a blue dot at position (269, 2).
; PLAN: r0=311(x), r1=85(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=2(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 85
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 2
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
