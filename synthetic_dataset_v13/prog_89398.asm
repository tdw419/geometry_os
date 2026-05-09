; DESCRIPTION: Composite: Creates a purple rectangular region at (11, 63) spanning 44 by 58 pixels then Sets a single black pixel at (385, 55).
; PLAN: r0=11(x), r1=63(y), r2=44(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=55(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 63
LDI r2, 44
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 55
LDI r7, 0x000000
PSET r5, r6, r7
HALT
