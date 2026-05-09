; DESCRIPTION: Composite: Creates a black rectangular region at (196, 142) spanning 86 by 84 pixels then Places a black line segment connecting (409, 146) to (31, 240) then Renders a green disk with center (260, 162) and radius 57.
; PLAN: r0=196(x), r1=142(y), r2=86(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x1), r6=146(y1), r7=31(x2), r8=240(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=162(y), r12=57(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 142
LDI r2, 86
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 146
LDI r7, 31
LDI r8, 240
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 162
LDI r12, 57
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
