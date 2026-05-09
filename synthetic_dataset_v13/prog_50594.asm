; DESCRIPTION: Composite: Creates a blue rectangular region at (105, 9) spanning 22 by 61 pixels then Sets a single magenta pixel at (319, 35).
; PLAN: r0=105(x), r1=9(y), r2=22(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=35(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 9
LDI r2, 22
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 35
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
