; DESCRIPTION: Composite: Creates a yellow rectangular region at (57, 50) spanning 97 by 118 pixels then Places a orange dot at position (64, 254).
; PLAN: r0=57(x), r1=50(y), r2=97(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=254(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 50
LDI r2, 97
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 254
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
