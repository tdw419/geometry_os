; DESCRIPTION: Composite: Creates a white rectangular region at (97, 93) spanning 118 by 68 pixels then Places a yellow dot at position (71, 8).
; PLAN: r0=97(x), r1=93(y), r2=118(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 93
LDI r2, 118
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
