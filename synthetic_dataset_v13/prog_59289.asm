; DESCRIPTION: Composite: Creates a yellow rectangular region at (378, 99) spanning 117 by 99 pixels then Places a purple line segment connecting (191, 128) to (129, 13) then Places a black dot at position (156, 144).
; PLAN: r0=378(x), r1=99(y), r2=117(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x1), r6=128(y1), r7=129(x2), r8=13(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=144(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 99
LDI r2, 117
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 128
LDI r7, 129
LDI r8, 13
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 144
LDI r12, 0x000000
PSET r10, r11, r12
HALT
