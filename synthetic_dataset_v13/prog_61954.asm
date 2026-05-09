; DESCRIPTION: Composite: Places a black 26x84 rectangle at position (208, 132) then Sets a single orange pixel at (229, 99).
; PLAN: r0=208(x), r1=132(y), r2=26(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=99(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 132
LDI r2, 26
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 99
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
