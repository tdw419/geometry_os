; DESCRIPTION: Composite: Creates a blue rectangular region at (34, 177) spanning 70 by 17 pixels then Sets a single blue pixel at (88, 242).
; PLAN: r0=34(x), r1=177(y), r2=70(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=242(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 177
LDI r2, 70
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 242
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
