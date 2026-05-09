; DESCRIPTION: Composite: Draws a green circle centered at (197, 99) with radius 79 then Renders a green line between points (354, 227) and (486, 169) then Renders a blue box of size 39x35 starting at (25, 110).
; PLAN: r0=197(x), r1=99(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x1), r6=227(y1), r7=486(x2), r8=169(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=25(x), r11=110(y), r12=39(width), r13=35(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 99
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 227
LDI r7, 486
LDI r8, 169
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 110
LDI r12, 39
LDI r13, 35
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
