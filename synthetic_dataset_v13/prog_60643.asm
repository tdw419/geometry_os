; DESCRIPTION: Composite: Creates a black rectangular region at (134, 119) spanning 110 by 116 pixels then Places a purple dot at position (274, 21).
; PLAN: r0=134(x), r1=119(y), r2=110(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=21(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 119
LDI r2, 110
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 21
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
