; DESCRIPTION: Composite: Creates a purple rectangular region at (361, 2) spanning 109 by 64 pixels then Renders a green line between points (378, 75) and (97, 15) then Places a blue dot at position (131, 99).
; PLAN: r0=361(x), r1=2(y), r2=109(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x1), r6=75(y1), r7=97(x2), r8=15(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=99(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 2
LDI r2, 109
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 75
LDI r7, 97
LDI r8, 15
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 99
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
