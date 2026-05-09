; DESCRIPTION: Composite: Creates a magenta circular shape at (308, 198) with radius 24 then Renders a magenta line between points (67, 185) and (50, 201) then Creates a orange rectangular region at (426, 169) spanning 64 by 66 pixels.
; PLAN: r0=308(x), r1=198(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x1), r6=185(y1), r7=50(x2), r8=201(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=169(y), r12=64(width), r13=66(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 198
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 185
LDI r7, 50
LDI r8, 201
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 169
LDI r12, 64
LDI r13, 66
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
