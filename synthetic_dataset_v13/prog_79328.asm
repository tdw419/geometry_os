; DESCRIPTION: Composite: Draws a green circle centered at (472, 129) with radius 26 then Renders a magenta line between points (435, 208) and (248, 176) then Creates a black rectangular region at (41, 82) spanning 26 by 87 pixels.
; PLAN: r0=472(x), r1=129(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x1), r6=208(y1), r7=248(x2), r8=176(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=41(x), r11=82(y), r12=26(width), r13=87(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 129
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 208
LDI r7, 248
LDI r8, 176
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 82
LDI r12, 26
LDI r13, 87
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
