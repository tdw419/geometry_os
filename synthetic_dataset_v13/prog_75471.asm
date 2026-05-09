; DESCRIPTION: Composite: Creates a black rectangular region at (318, 95) spanning 96 by 15 pixels then Places a orange dot at position (489, 227).
; PLAN: r0=318(x), r1=95(y), r2=96(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x), r6=227(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 95
LDI r2, 96
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 227
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
