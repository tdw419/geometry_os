; DESCRIPTION: Composite: Draws a red line from (235, 227) to (87, 172) then Creates a yellow circular shape at (241, 144) with radius 48 then Draws a blue rectangle at (91, 4) with width 23 and height 89.
; PLAN: r0=235(x1), r1=227(y1), r2=87(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=144(y), r7=48(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=91(x), r11=4(y), r12=23(width), r13=89(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 227
LDI r2, 87
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 144
LDI r7, 48
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 91
LDI r11, 4
LDI r12, 23
LDI r13, 89
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
