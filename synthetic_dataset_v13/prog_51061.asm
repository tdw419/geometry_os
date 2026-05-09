; DESCRIPTION: Composite: Creates a purple rectangular region at (115, 133) spanning 38 by 106 pixels then Sets a single green pixel at (182, 145).
; PLAN: r0=115(x), r1=133(y), r2=38(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=145(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 133
LDI r2, 38
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 145
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
