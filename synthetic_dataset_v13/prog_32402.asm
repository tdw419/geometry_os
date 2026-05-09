; DESCRIPTION: Composite: Renders a black disk with center (205, 108) and radius 72 then Places a purple dot at position (316, 192).
; PLAN: r0=205(x), r1=108(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=192(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 108
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 192
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
