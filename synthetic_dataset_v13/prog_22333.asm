; DESCRIPTION: Composite: Draws a black rectangle at (174, 6) with width 89 and height 42 then Renders a black line between points (191, 62) and (385, 49) then Creates a purple circular shape at (152, 117) with radius 15.
; PLAN: r0=174(x), r1=6(y), r2=89(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x1), r6=62(y1), r7=385(x2), r8=49(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=117(y), r12=15(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 6
LDI r2, 89
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 62
LDI r7, 385
LDI r8, 49
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 117
LDI r12, 15
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
