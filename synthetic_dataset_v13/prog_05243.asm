; DESCRIPTION: Composite: Creates a black rectangular region at (264, 28) spanning 18 by 53 pixels then Sets a single blue pixel at (321, 103).
; PLAN: r0=264(x), r1=28(y), r2=18(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=103(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 28
LDI r2, 18
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 103
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
