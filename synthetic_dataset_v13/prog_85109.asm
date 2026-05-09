; DESCRIPTION: Composite: Draws a blue line from (141, 159) to (325, 10) then Draws a yellow rectangle at (128, 82) with width 119 and height 98 then Creates a green circular shape at (462, 147) with radius 12.
; PLAN: r0=141(x1), r1=159(y1), r2=325(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=82(y), r7=119(width), r8=98(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x), r11=147(y), r12=12(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 141
LDI r1, 159
LDI r2, 325
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 82
LDI r7, 119
LDI r8, 98
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 147
LDI r12, 12
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
