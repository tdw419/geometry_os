; DESCRIPTION: Composite: Places a yellow line segment connecting (357, 128) to (281, 176) then Renders a black box of size 56x83 starting at (227, 129) then Draws a green circle centered at (357, 157) with radius 17.
; PLAN: r0=357(x1), r1=128(y1), r2=281(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=129(y), r7=56(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=357(x), r11=157(y), r12=17(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 128
LDI r2, 281
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 129
LDI r7, 56
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 157
LDI r12, 17
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
