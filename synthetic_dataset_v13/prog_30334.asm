; DESCRIPTION: Composite: Renders a yellow line between points (406, 167) and (69, 13) then Sets a single blue pixel at (176, 84) then Creates a yellow rectangular region at (112, 68) spanning 66 by 102 pixels.
; PLAN: r0=406(x1), r1=167(y1), r2=69(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=84(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=68(y), r12=66(width), r13=102(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 167
LDI r2, 69
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 84
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 112
LDI r11, 68
LDI r12, 66
LDI r13, 102
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
