; DESCRIPTION: Composite: Renders a red disk with center (390, 156) and radius 38 then Places a red dot at position (194, 46).
; PLAN: r0=390(x), r1=156(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 156
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
