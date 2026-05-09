; DESCRIPTION: Composite: Places a magenta 17x71 rectangle at position (414, 53) then Sets a single orange pixel at (381, 35).
; PLAN: r0=414(x), r1=53(y), r2=17(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=35(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 53
LDI r2, 17
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 35
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
