; DESCRIPTION: Composite: Renders a red disk with center (443, 104) and radius 53 then Sets a single purple pixel at (396, 203).
; PLAN: r0=443(x), r1=104(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=203(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 443
LDI r1, 104
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 203
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
