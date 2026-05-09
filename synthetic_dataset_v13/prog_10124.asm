; DESCRIPTION: Composite: Creates a purple rectangular region at (115, 153) spanning 17 by 80 pixels then Places a orange dot at position (364, 4).
; PLAN: r0=115(x), r1=153(y), r2=17(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=4(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 153
LDI r2, 17
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 4
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
