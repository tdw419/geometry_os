; DESCRIPTION: Composite: Creates a blue rectangular region at (396, 158) spanning 65 by 91 pixels then Sets a single black pixel at (131, 245).
; PLAN: r0=396(x), r1=158(y), r2=65(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=245(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 158
LDI r2, 65
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 245
LDI r7, 0x000000
PSET r5, r6, r7
HALT
