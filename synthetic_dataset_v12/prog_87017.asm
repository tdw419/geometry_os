; DESCRIPTION: Composite: Places a red dot at position (414, 145) then Renders a orange disk with center (355, 156) and radius 34.
; PLAN: r0=414(x), r1=145(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=156(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 414
LDI r1, 145
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 355
LDI r6, 156
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
