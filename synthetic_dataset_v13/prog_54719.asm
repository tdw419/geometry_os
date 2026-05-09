; DESCRIPTION: Composite: Creates a blue rectangular region at (399, 110) spanning 98 by 77 pixels then Sets a single magenta pixel at (476, 130).
; PLAN: r0=399(x), r1=110(y), r2=98(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x), r6=130(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 110
LDI r2, 98
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 130
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
