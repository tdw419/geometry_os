; DESCRIPTION: Composite: Creates a black rectangular region at (265, 106) spanning 31 by 120 pixels then Sets a single cyan pixel at (102, 250).
; PLAN: r0=265(x), r1=106(y), r2=31(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=250(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 265
LDI r1, 106
LDI r2, 31
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 250
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
