; DESCRIPTION: Composite: Places a yellow line segment connecting (257, 75) to (478, 89) then Creates a black rectangular region at (304, 71) spanning 37 by 101 pixels.
; PLAN: r0=257(x1), r1=75(y1), r2=478(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=71(y), r7=37(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 75
LDI r2, 478
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 71
LDI r7, 37
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
