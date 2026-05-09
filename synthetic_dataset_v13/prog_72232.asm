; DESCRIPTION: Composite: Creates a black rectangular region at (223, 191) spanning 47 by 47 pixels then Sets a single black pixel at (375, 134).
; PLAN: r0=223(x), r1=191(y), r2=47(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=134(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 191
LDI r2, 47
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 134
LDI r7, 0x000000
PSET r5, r6, r7
HALT
