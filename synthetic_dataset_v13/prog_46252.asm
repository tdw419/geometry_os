; DESCRIPTION: Composite: Creates a green rectangular region at (155, 51) spanning 33 by 58 pixels then Places a orange dot at position (99, 172).
; PLAN: r0=155(x), r1=51(y), r2=33(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=172(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 51
LDI r2, 33
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 172
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
