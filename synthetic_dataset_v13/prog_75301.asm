; DESCRIPTION: Composite: Creates a magenta circular shape at (191, 144) with radius 39 then Places a orange line segment connecting (85, 190) to (490, 13) then Creates a white rectangular region at (314, 13) spanning 115 by 60 pixels.
; PLAN: r0=191(x), r1=144(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x1), r6=190(y1), r7=490(x2), r8=13(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=13(y), r12=115(width), r13=60(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 144
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 190
LDI r7, 490
LDI r8, 13
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 13
LDI r12, 115
LDI r13, 60
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
