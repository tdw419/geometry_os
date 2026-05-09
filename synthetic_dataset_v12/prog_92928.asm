; DESCRIPTION: Composite: Draws a purple rectangle at (213, 140) with width 79 and height 111 then Places a purple line segment connecting (502, 155) to (341, 97) then Draws a orange circle centered at (35, 62) with radius 13.
; PLAN: r0=213(x), r1=140(y), r2=79(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x1), r6=155(y1), r7=341(x2), r8=97(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=62(y), r12=13(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 140
LDI r2, 79
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 155
LDI r7, 341
LDI r8, 97
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 62
LDI r12, 13
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
