; DESCRIPTION: Composite: Creates a white rectangular region at (131, 21) spanning 49 by 70 pixels then Sets a single green pixel at (357, 51).
; PLAN: r0=131(x), r1=21(y), r2=49(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=51(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 21
LDI r2, 49
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 51
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
