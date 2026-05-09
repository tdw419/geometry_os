; DESCRIPTION: Composite: Creates a blue rectangular region at (191, 43) spanning 35 by 118 pixels then Sets a single yellow pixel at (476, 193).
; PLAN: r0=191(x), r1=43(y), r2=35(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x), r6=193(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 43
LDI r2, 35
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 193
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
