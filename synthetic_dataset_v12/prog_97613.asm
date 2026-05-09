; DESCRIPTION: Composite: Creates a orange rectangular region at (8, 45) spanning 107 by 115 pixels then Places a green dot at position (454, 149).
; PLAN: r0=8(x), r1=45(y), r2=107(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=149(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 45
LDI r2, 107
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 149
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
