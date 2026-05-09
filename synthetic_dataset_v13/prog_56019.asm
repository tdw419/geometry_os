; DESCRIPTION: Composite: Places a magenta dot at position (383, 144) then Places a purple line segment connecting (252, 182) to (37, 149) then Draws a blue circle centered at (106, 61) with radius 38.
; PLAN: r0=383(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=252(x1), r6=182(y1), r7=37(x2), r8=149(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=106(x), r11=61(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 182
LDI r7, 37
LDI r8, 149
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 61
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
