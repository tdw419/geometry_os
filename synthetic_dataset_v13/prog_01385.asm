; DESCRIPTION: Composite: Creates a orange rectangular region at (33, 61) spanning 116 by 41 pixels then Sets a single blue pixel at (332, 168).
; PLAN: r0=33(x), r1=61(y), r2=116(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=168(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 61
LDI r2, 116
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 168
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
