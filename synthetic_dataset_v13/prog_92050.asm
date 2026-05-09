; DESCRIPTION: Composite: Creates a purple rectangular region at (322, 14) spanning 34 by 85 pixels then Sets a single red pixel at (164, 42).
; PLAN: r0=322(x), r1=14(y), r2=34(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=42(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 14
LDI r2, 34
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 42
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
