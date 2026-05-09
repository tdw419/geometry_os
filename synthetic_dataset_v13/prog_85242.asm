; DESCRIPTION: Composite: Places a yellow 25x103 rectangle at position (47, 80) then Renders a blue disk with center (235, 218) and radius 26 then Renders a orange line between points (316, 36) and (157, 11).
; PLAN: r0=47(x), r1=80(y), r2=25(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=218(y), r7=26(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x1), r11=36(y1), r12=157(x2), r13=11(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 80
LDI r2, 25
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 218
LDI r7, 26
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 36
LDI r12, 157
LDI r13, 11
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
