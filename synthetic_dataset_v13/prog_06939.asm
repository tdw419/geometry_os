; DESCRIPTION: Composite: Draws a black circle centered at (416, 132) with radius 80 then Draws a black rectangle at (372, 23) with width 60 and height 89 then Renders a green line between points (463, 51) and (211, 134).
; PLAN: r0=416(x), r1=132(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=23(y), r7=60(width), r8=89(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x1), r11=51(y1), r12=211(x2), r13=134(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 132
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 23
LDI r7, 60
LDI r8, 89
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 51
LDI r12, 211
LDI r13, 134
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
