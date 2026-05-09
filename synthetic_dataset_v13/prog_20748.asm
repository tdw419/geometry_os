; DESCRIPTION: Composite: Creates a white rectangular region at (164, 57) spanning 11 by 20 pixels then Renders a green line between points (33, 64) and (414, 3) then Renders a blue disk with center (253, 79) and radius 58.
; PLAN: r0=164(x), r1=57(y), r2=11(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=64(y1), r7=414(x2), r8=3(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=79(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 57
LDI r2, 11
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 64
LDI r7, 414
LDI r8, 3
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 79
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
