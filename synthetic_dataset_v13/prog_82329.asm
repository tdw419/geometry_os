; DESCRIPTION: Composite: Creates a white rectangular region at (409, 78) spanning 80 by 12 pixels then Renders a magenta line between points (507, 224) and (195, 118) then Places a green circle of radius 75 at center (223, 135).
; PLAN: r0=409(x), r1=78(y), r2=80(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x1), r6=224(y1), r7=195(x2), r8=118(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=135(y), r12=75(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 409
LDI r1, 78
LDI r2, 80
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 224
LDI r7, 195
LDI r8, 118
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 135
LDI r12, 75
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
