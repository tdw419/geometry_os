; DESCRIPTION: Composite: Places a yellow dot at position (300, 159) then Renders a red disk with center (381, 118) and radius 69.
; PLAN: r0=300(x), r1=159(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=118(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 300
LDI r1, 159
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 381
LDI r6, 118
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
