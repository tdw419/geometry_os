; DESCRIPTION: Composite: Places a black 95x52 rectangle at position (44, 118) then Sets a single orange pixel at (351, 241).
; PLAN: r0=44(x), r1=118(y), r2=95(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=241(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 118
LDI r2, 95
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 241
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
