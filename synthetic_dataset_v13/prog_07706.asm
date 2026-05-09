; DESCRIPTION: Composite: Renders a green line between points (378, 211) and (1, 160) then Creates a green rectangular region at (444, 13) spanning 49 by 16 pixels then Draws a red circle centered at (208, 134) with radius 53.
; PLAN: r0=378(x1), r1=211(y1), r2=1(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=13(y), r7=49(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=134(y), r12=53(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 378
LDI r1, 211
LDI r2, 1
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 13
LDI r7, 49
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 134
LDI r12, 53
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
