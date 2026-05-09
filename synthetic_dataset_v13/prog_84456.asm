; DESCRIPTION: Composite: Creates a black rectangular region at (405, 142) spanning 62 by 110 pixels then Places a yellow dot at position (152, 66).
; PLAN: r0=405(x), r1=142(y), r2=62(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=66(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 142
LDI r2, 62
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 66
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
