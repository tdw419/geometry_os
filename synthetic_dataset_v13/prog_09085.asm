; DESCRIPTION: Composite: Creates a orange rectangular region at (98, 142) spanning 52 by 99 pixels then Sets a single yellow pixel at (10, 153).
; PLAN: r0=98(x), r1=142(y), r2=52(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=153(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 98
LDI r1, 142
LDI r2, 52
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 153
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
