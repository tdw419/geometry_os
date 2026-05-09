; DESCRIPTION: Composite: Creates a black rectangular region at (209, 101) spanning 19 by 94 pixels then Sets a single black pixel at (354, 101).
; PLAN: r0=209(x), r1=101(y), r2=19(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=101(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 101
LDI r2, 19
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 101
LDI r7, 0x000000
PSET r5, r6, r7
HALT
