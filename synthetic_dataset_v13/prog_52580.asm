; DESCRIPTION: Composite: Creates a blue rectangular region at (439, 150) spanning 52 by 18 pixels then Sets a single cyan pixel at (405, 201).
; PLAN: r0=439(x), r1=150(y), r2=52(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=201(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 150
LDI r2, 52
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 201
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
