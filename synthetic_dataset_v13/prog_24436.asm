; DESCRIPTION: Composite: Creates a green rectangular region at (225, 138) spanning 100 by 107 pixels then Places a purple dot at position (452, 123).
; PLAN: r0=225(x), r1=138(y), r2=100(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=123(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 138
LDI r2, 100
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 123
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
