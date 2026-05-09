; DESCRIPTION: Composite: Places a white line segment connecting (52, 60) to (316, 222) then Places a orange 14x32 rectangle at position (63, 162) then Creates a blue circular shape at (179, 73) with radius 52.
; PLAN: r0=52(x1), r1=60(y1), r2=316(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=162(y), r7=14(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x), r11=73(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 52
LDI r1, 60
LDI r2, 316
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 162
LDI r7, 14
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 73
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
