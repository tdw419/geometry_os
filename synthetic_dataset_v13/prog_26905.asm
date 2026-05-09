; DESCRIPTION: Composite: Renders a white box of size 26x78 starting at (402, 170) then Places a green circle of radius 23 at center (177, 122) then Renders a magenta line between points (8, 57) and (364, 1).
; PLAN: r0=402(x), r1=170(y), r2=26(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=122(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x1), r11=57(y1), r12=364(x2), r13=1(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 170
LDI r2, 26
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 122
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 57
LDI r12, 364
LDI r13, 1
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
