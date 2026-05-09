; DESCRIPTION: Composite: Places a blue circle of radius 78 at center (309, 169) then Places a purple dot at position (353, 172).
; PLAN: r0=309(x), r1=169(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=172(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 169
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 172
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
