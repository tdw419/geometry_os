; DESCRIPTION: Composite: Creates a blue rectangular region at (115, 91) spanning 60 by 112 pixels then Places a blue dot at position (324, 192).
; PLAN: r0=115(x), r1=91(y), r2=60(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=192(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 91
LDI r2, 60
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 192
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
