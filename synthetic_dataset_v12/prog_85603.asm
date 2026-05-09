; DESCRIPTION: Composite: Places a white circle of radius 80 at center (133, 98) then Renders a purple line between points (146, 129) and (266, 169) then Creates a green rectangular region at (253, 78) spanning 104 by 101 pixels.
; PLAN: r0=133(x), r1=98(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=129(y1), r7=266(x2), r8=169(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=78(y), r12=104(width), r13=101(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 98
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 129
LDI r7, 266
LDI r8, 169
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 78
LDI r12, 104
LDI r13, 101
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
