; DESCRIPTION: Composite: Creates a cyan rectangular region at (432, 89) spanning 37 by 107 pixels then Places a red dot at position (506, 90).
; PLAN: r0=432(x), r1=89(y), r2=37(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x), r6=90(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 89
LDI r2, 37
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 90
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
