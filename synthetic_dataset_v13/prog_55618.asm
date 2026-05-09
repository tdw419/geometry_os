; DESCRIPTION: Composite: Creates a blue rectangular region at (325, 143) spanning 84 by 46 pixels then Places a black dot at position (155, 120).
; PLAN: r0=325(x), r1=143(y), r2=84(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=120(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 143
LDI r2, 84
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 120
LDI r7, 0x000000
PSET r5, r6, r7
HALT
