; DESCRIPTION: Composite: Renders a yellow line between points (130, 126) and (459, 151) then Renders a black box of size 94x101 starting at (331, 44) then Renders a white disk with center (207, 106) and radius 62.
; PLAN: r0=130(x1), r1=126(y1), r2=459(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=44(y), r7=94(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x), r11=106(y), r12=62(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 126
LDI r2, 459
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 44
LDI r7, 94
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 106
LDI r12, 62
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
