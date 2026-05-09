; DESCRIPTION: Composite: Places a orange line segment connecting (189, 62) to (83, 231) then Draws a green circle centered at (119, 183) with radius 55 then Renders a green box of size 46x67 starting at (89, 126).
; PLAN: r0=189(x1), r1=62(y1), r2=83(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=183(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=89(x), r11=126(y), r12=46(width), r13=67(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 62
LDI r2, 83
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 183
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 89
LDI r11, 126
LDI r12, 46
LDI r13, 67
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
