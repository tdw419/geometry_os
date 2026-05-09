; DESCRIPTION: Composite: Creates a black rectangular region at (181, 56) spanning 110 by 81 pixels then Sets a single red pixel at (177, 234).
; PLAN: r0=181(x), r1=56(y), r2=110(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=234(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 56
LDI r2, 110
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 234
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
