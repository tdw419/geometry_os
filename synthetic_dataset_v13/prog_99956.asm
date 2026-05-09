; DESCRIPTION: Composite: Renders a green line between points (448, 173) and (137, 225) then Renders a purple box of size 109x75 starting at (392, 40) then Creates a white circular shape at (21, 203) with radius 17.
; PLAN: r0=448(x1), r1=173(y1), r2=137(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=40(y), r7=109(width), r8=75(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=21(x), r11=203(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 173
LDI r2, 137
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 40
LDI r7, 109
LDI r8, 75
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 203
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
