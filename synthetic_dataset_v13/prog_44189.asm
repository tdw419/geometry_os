; DESCRIPTION: Composite: Renders a red disk with center (155, 147) and radius 15 then Draws a yellow line from (62, 119) to (406, 252) then Places a magenta 104x83 rectangle at position (322, 48).
; PLAN: r0=155(x), r1=147(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x1), r6=119(y1), r7=406(x2), r8=252(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=322(x), r11=48(y), r12=104(width), r13=83(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 147
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 119
LDI r7, 406
LDI r8, 252
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 48
LDI r12, 104
LDI r13, 83
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
