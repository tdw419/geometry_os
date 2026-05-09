; DESCRIPTION: Composite: Creates a orange rectangular region at (408, 65) spanning 65 by 29 pixels then Sets a single blue pixel at (102, 193).
; PLAN: r0=408(x), r1=65(y), r2=65(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=193(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 65
LDI r2, 65
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 193
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
