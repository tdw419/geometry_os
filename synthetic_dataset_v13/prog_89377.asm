; DESCRIPTION: Composite: Creates a purple circular shape at (195, 89) with radius 32 then Places a blue line segment connecting (52, 41) to (222, 186) then Creates a magenta rectangular region at (335, 89) spanning 54 by 85 pixels.
; PLAN: r0=195(x), r1=89(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x1), r6=41(y1), r7=222(x2), r8=186(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=335(x), r11=89(y), r12=54(width), r13=85(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 89
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 41
LDI r7, 222
LDI r8, 186
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 89
LDI r12, 54
LDI r13, 85
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
