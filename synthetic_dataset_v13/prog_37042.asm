; DESCRIPTION: Composite: Places a black circle of radius 38 at center (177, 150) then Renders a orange line between points (463, 250) and (428, 156) then Places a purple 97x114 rectangle at position (412, 98).
; PLAN: r0=177(x), r1=150(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=250(y1), r7=428(x2), r8=156(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=412(x), r11=98(y), r12=97(width), r13=114(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 150
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 250
LDI r7, 428
LDI r8, 156
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 98
LDI r12, 97
LDI r13, 114
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
