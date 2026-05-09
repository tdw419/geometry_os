; DESCRIPTION: Composite: Creates a yellow rectangular region at (153, 79) spanning 18 by 106 pixels then Places a purple dot at position (209, 251).
; PLAN: r0=153(x), r1=79(y), r2=18(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=251(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 79
LDI r2, 18
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 251
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
