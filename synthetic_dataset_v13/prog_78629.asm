; DESCRIPTION: Composite: Creates a magenta rectangular region at (272, 110) spanning 51 by 19 pixels then Sets a single black pixel at (397, 11).
; PLAN: r0=272(x), r1=110(y), r2=51(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=11(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 110
LDI r2, 51
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 11
LDI r7, 0x000000
PSET r5, r6, r7
HALT
