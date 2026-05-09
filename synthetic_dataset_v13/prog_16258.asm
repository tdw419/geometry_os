; DESCRIPTION: Composite: Places a yellow line segment connecting (220, 186) to (483, 5) then Draws a black rectangle at (361, 155) with width 83 and height 48 then Places a green circle of radius 20 at center (253, 167).
; PLAN: r0=220(x1), r1=186(y1), r2=483(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=155(y), r7=83(width), r8=48(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=167(y), r12=20(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 186
LDI r2, 483
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 155
LDI r7, 83
LDI r8, 48
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 167
LDI r12, 20
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
