; DESCRIPTION: Composite: Creates a orange rectangular region at (30, 105) spanning 31 by 18 pixels then Places a orange dot at position (132, 179).
; PLAN: r0=30(x), r1=105(y), r2=31(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=179(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 105
LDI r2, 31
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 179
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
