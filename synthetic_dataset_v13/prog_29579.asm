; DESCRIPTION: Composite: Draws a white rectangle at (331, 163) with width 33 and height 55 then Renders a purple line between points (171, 103) and (269, 235) then Places a orange circle of radius 73 at center (156, 145).
; PLAN: r0=331(x), r1=163(y), r2=33(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x1), r6=103(y1), r7=269(x2), r8=235(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=145(y), r12=73(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 163
LDI r2, 33
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 103
LDI r7, 269
LDI r8, 235
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 145
LDI r12, 73
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
