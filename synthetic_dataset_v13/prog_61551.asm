; DESCRIPTION: Composite: Creates a green rectangular region at (158, 207) spanning 30 by 30 pixels then Sets a single blue pixel at (368, 15).
; PLAN: r0=158(x), r1=207(y), r2=30(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=15(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 207
LDI r2, 30
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 15
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
