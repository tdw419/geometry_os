; DESCRIPTION: Composite: Creates a cyan rectangular region at (389, 11) spanning 31 by 15 pixels then Sets a single white pixel at (6, 247).
; PLAN: r0=389(x), r1=11(y), r2=31(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x), r6=247(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 11
LDI r2, 31
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 247
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
