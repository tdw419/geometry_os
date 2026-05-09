; DESCRIPTION: Composite: Creates a white rectangular region at (423, 107) spanning 12 by 44 pixels then Places a purple dot at position (211, 66).
; PLAN: r0=423(x), r1=107(y), r2=12(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=66(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 107
LDI r2, 12
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 66
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
