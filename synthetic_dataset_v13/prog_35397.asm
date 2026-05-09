; DESCRIPTION: Composite: Creates a magenta rectangular region at (194, 26) spanning 101 by 43 pixels then Sets a single orange pixel at (179, 43).
; PLAN: r0=194(x), r1=26(y), r2=101(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=43(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 194
LDI r1, 26
LDI r2, 101
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 43
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
