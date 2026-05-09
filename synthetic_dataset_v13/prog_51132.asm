; DESCRIPTION: Composite: Places a red dot at position (351, 201) then Creates a cyan rectangular region at (383, 132) spanning 51 by 48 pixels.
; PLAN: r0=351(x), r1=201(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=132(y), r7=51(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 201
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 383
LDI r6, 132
LDI r7, 51
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
