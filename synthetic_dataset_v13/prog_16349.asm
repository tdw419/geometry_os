; DESCRIPTION: Composite: Places a black circle of radius 65 at center (94, 143) then Renders a green line between points (223, 62) and (444, 75) then Renders a black box of size 87x63 starting at (31, 104).
; PLAN: r0=94(x), r1=143(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=62(y1), r7=444(x2), r8=75(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=31(x), r11=104(y), r12=87(width), r13=63(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 143
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 62
LDI r7, 444
LDI r8, 75
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 104
LDI r12, 87
LDI r13, 63
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
