; DESCRIPTION: Composite: Creates a white rectangular region at (209, 201) spanning 12 by 24 pixels then Sets a single black pixel at (338, 38).
; PLAN: r0=209(x), r1=201(y), r2=12(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=38(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 201
LDI r2, 12
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 38
LDI r7, 0x000000
PSET r5, r6, r7
HALT
