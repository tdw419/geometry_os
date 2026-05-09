; DESCRIPTION: Composite: Places a yellow line segment connecting (16, 1) to (260, 169) then Places a white 23x13 rectangle at position (433, 233) then Creates a magenta circular shape at (370, 79) with radius 19.
; PLAN: r0=16(x1), r1=1(y1), r2=260(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=233(y), r7=23(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x), r11=79(y), r12=19(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 16
LDI r1, 1
LDI r2, 260
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 233
LDI r7, 23
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 79
LDI r12, 19
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
