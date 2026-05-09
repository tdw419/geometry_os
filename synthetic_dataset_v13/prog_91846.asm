; DESCRIPTION: Composite: Places a yellow 77x114 rectangle at position (366, 3) then Draws a purple line from (87, 255) to (142, 61) then Creates a magenta circular shape at (447, 42) with radius 12.
; PLAN: r0=366(x), r1=3(y), r2=77(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=255(y1), r7=142(x2), r8=61(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=447(x), r11=42(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 3
LDI r2, 77
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 255
LDI r7, 142
LDI r8, 61
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 42
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
