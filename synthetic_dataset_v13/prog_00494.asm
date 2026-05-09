; DESCRIPTION: Composite: Renders a green line between points (70, 77) and (22, 216) then Creates a blue rectangular region at (37, 33) spanning 22 by 113 pixels then Creates a white circular shape at (304, 240) with radius 11.
; PLAN: r0=70(x1), r1=77(y1), r2=22(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=33(y), r7=22(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=240(y), r12=11(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 70
LDI r1, 77
LDI r2, 22
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 33
LDI r7, 22
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 240
LDI r12, 11
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
