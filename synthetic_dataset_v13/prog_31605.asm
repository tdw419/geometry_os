; DESCRIPTION: Composite: Creates a yellow rectangular region at (26, 145) spanning 94 by 67 pixels then Places a cyan dot at position (491, 185).
; PLAN: r0=26(x), r1=145(y), r2=94(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x), r6=185(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 145
LDI r2, 94
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 185
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
