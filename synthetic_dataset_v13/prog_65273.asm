; DESCRIPTION: Composite: Creates a orange rectangular region at (393, 181) spanning 62 by 38 pixels then Sets a single yellow pixel at (115, 66).
; PLAN: r0=393(x), r1=181(y), r2=62(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=66(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 181
LDI r2, 62
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 66
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
