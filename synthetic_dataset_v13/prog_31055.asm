; DESCRIPTION: Composite: Renders a purple disk with center (212, 142) and radius 67 then Sets a single black pixel at (396, 182).
; PLAN: r0=212(x), r1=142(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=182(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 142
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 182
LDI r7, 0x000000
PSET r5, r6, r7
HALT
