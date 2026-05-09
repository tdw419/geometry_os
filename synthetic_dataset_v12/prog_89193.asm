; DESCRIPTION: Composite: Draws a magenta rectangle at (371, 20) with width 109 and height 58 then Places a black line segment connecting (297, 82) to (44, 162) then Creates a purple circular shape at (325, 90) with radius 27.
; PLAN: r0=371(x), r1=20(y), r2=109(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x1), r6=82(y1), r7=44(x2), r8=162(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=90(y), r12=27(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 20
LDI r2, 109
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 82
LDI r7, 44
LDI r8, 162
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 90
LDI r12, 27
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
