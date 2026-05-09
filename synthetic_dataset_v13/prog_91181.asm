; DESCRIPTION: Composite: Renders a magenta box of size 106x29 starting at (151, 56) then Places a green circle of radius 31 at center (451, 218) then Places a white line segment connecting (26, 212) to (489, 55).
; PLAN: r0=151(x), r1=56(y), r2=106(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x), r6=218(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x1), r11=212(y1), r12=489(x2), r13=55(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 56
LDI r2, 106
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 218
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 212
LDI r12, 489
LDI r13, 55
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
