; DESCRIPTION: Composite: Renders a blue disk with center (311, 159) and radius 68 then Places a red dot at position (314, 61).
; PLAN: r0=311(x), r1=159(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=61(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 159
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 61
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
