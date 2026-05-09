; DESCRIPTION: Composite: Creates a black rectangular region at (432, 78) spanning 26 by 116 pixels then Places a purple dot at position (109, 255).
; PLAN: r0=432(x), r1=78(y), r2=26(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=255(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 78
LDI r2, 26
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 255
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
