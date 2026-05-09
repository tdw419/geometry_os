; DESCRIPTION: Composite: Creates a black rectangular region at (384, 85) spanning 47 by 76 pixels then Sets a single blue pixel at (93, 121).
; PLAN: r0=384(x), r1=85(y), r2=47(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=121(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 85
LDI r2, 47
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 121
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
