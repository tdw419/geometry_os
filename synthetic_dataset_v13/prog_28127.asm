; DESCRIPTION: Composite: Creates a green rectangular region at (18, 3) spanning 77 by 98 pixels then Sets a single green pixel at (447, 138).
; PLAN: r0=18(x), r1=3(y), r2=77(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=138(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 18
LDI r1, 3
LDI r2, 77
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 138
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
