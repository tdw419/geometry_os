; DESCRIPTION: Composite: Draws a purple circle centered at (308, 57) with radius 26 then Renders a yellow line between points (162, 159) and (191, 205) then Draws a cyan rectangle at (55, 170) with width 63 and height 61.
; PLAN: r0=308(x), r1=57(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x1), r6=159(y1), r7=191(x2), r8=205(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=170(y), r12=63(width), r13=61(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 57
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 159
LDI r7, 191
LDI r8, 205
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 170
LDI r12, 63
LDI r13, 61
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
