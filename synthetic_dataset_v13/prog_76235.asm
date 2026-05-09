; DESCRIPTION: Composite: Places a magenta 58x112 rectangle at position (211, 131) then Draws a purple line from (400, 55) to (126, 123) then Creates a purple circular shape at (305, 211) with radius 23.
; PLAN: r0=211(x), r1=131(y), r2=58(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=55(y1), r7=126(x2), r8=123(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=211(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 131
LDI r2, 58
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 55
LDI r7, 126
LDI r8, 123
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 211
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
