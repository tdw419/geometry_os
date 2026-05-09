; DESCRIPTION: Composite: Renders a yellow line between points (393, 245) and (381, 248) then Renders a purple box of size 19x84 starting at (357, 160) then Creates a yellow circular shape at (21, 207) with radius 15.
; PLAN: r0=393(x1), r1=245(y1), r2=381(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=160(y), r7=19(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=21(x), r11=207(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 245
LDI r2, 381
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 160
LDI r7, 19
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 207
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
