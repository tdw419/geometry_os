; DESCRIPTION: Composite: Creates a blue rectangular region at (232, 85) spanning 50 by 88 pixels then Sets a single blue pixel at (167, 8).
; PLAN: r0=232(x), r1=85(y), r2=50(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=8(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 85
LDI r2, 50
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 8
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
