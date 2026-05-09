; DESCRIPTION: Composite: Creates a blue rectangular region at (119, 211) spanning 73 by 28 pixels then Sets a single purple pixel at (502, 183).
; PLAN: r0=119(x), r1=211(y), r2=73(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x), r6=183(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 119
LDI r1, 211
LDI r2, 73
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 183
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
