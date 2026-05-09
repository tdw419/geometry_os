; DESCRIPTION: Composite: Creates a purple rectangular region at (301, 119) spanning 80 by 33 pixels then Places a yellow dot at position (407, 133).
; PLAN: r0=301(x), r1=119(y), r2=80(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=133(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 119
LDI r2, 80
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 133
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
