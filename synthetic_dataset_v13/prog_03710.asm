; DESCRIPTION: Composite: Creates a blue rectangular region at (352, 95) spanning 58 by 85 pixels then Sets a single magenta pixel at (418, 11).
; PLAN: r0=352(x), r1=95(y), r2=58(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=11(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 95
LDI r2, 58
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 11
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
