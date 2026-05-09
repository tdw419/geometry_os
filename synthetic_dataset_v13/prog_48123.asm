; DESCRIPTION: Composite: Renders a magenta disk with center (355, 152) and radius 52 then Creates a yellow rectangular region at (13, 7) spanning 33 by 103 pixels then Renders a orange line between points (89, 24) and (68, 139).
; PLAN: r0=355(x), r1=152(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=7(y), r7=33(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x1), r11=24(y1), r12=68(x2), r13=139(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 152
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 7
LDI r7, 33
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 24
LDI r12, 68
LDI r13, 139
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
