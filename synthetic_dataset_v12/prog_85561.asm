; DESCRIPTION: Composite: Creates a magenta rectangular region at (165, 65) spanning 10 by 101 pixels then Sets a single blue pixel at (501, 214).
; PLAN: r0=165(x), r1=65(y), r2=10(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x), r6=214(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 65
LDI r2, 10
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 214
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
