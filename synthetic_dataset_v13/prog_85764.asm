; DESCRIPTION: Composite: Creates a yellow rectangular region at (229, 3) spanning 79 by 52 pixels then Sets a single black pixel at (52, 94).
; PLAN: r0=229(x), r1=3(y), r2=79(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=94(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 3
LDI r2, 79
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 94
LDI r7, 0x000000
PSET r5, r6, r7
HALT
