; DESCRIPTION: Composite: Creates a blue rectangular region at (86, 159) spanning 107 by 13 pixels then Sets a single red pixel at (386, 192).
; PLAN: r0=86(x), r1=159(y), r2=107(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=192(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 159
LDI r2, 107
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 192
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
