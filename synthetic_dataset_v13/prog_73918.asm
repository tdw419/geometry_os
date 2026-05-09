; DESCRIPTION: Composite: Draws a yellow rectangle at (192, 38) with width 71 and height 70 then Renders a purple disk with center (57, 152) and radius 47 then Places a purple line segment connecting (248, 47) to (345, 252).
; PLAN: r0=192(x), r1=38(y), r2=71(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=152(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x1), r11=47(y1), r12=345(x2), r13=252(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 38
LDI r2, 71
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 152
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 47
LDI r12, 345
LDI r13, 252
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
