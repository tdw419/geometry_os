; DESCRIPTION: Composite: Creates a green rectangular region at (354, 41) spanning 102 by 88 pixels then Sets a single black pixel at (189, 148).
; PLAN: r0=354(x), r1=41(y), r2=102(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=148(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 41
LDI r2, 102
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 148
LDI r7, 0x000000
PSET r5, r6, r7
HALT
