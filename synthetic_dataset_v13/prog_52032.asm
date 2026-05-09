; DESCRIPTION: Composite: Creates a green rectangular region at (179, 119) spanning 11 by 115 pixels then Places a cyan dot at position (253, 48).
; PLAN: r0=179(x), r1=119(y), r2=11(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=48(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 119
LDI r2, 11
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 48
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
