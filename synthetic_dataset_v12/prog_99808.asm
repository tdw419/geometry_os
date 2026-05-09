; DESCRIPTION: Composite: Places a purple 50x14 rectangle at position (81, 91) then Renders a green disk with center (174, 183) and radius 37 then Places a white line segment connecting (4, 170) to (34, 244).
; PLAN: r0=81(x), r1=91(y), r2=50(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=183(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x1), r11=170(y1), r12=34(x2), r13=244(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 91
LDI r2, 50
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 183
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 170
LDI r12, 34
LDI r13, 244
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
