; DESCRIPTION: Composite: Creates a green rectangular region at (361, 68) spanning 81 by 96 pixels then Places a magenta line segment connecting (381, 30) to (32, 68) then Creates a orange circular shape at (266, 142) with radius 31.
; PLAN: r0=361(x), r1=68(y), r2=81(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x1), r6=30(y1), r7=32(x2), r8=68(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=266(x), r11=142(y), r12=31(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 361
LDI r1, 68
LDI r2, 81
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 30
LDI r7, 32
LDI r8, 68
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 142
LDI r12, 31
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
