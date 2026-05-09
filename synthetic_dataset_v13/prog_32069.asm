; DESCRIPTION: Composite: Draws a black rectangle at (233, 17) with width 68 and height 59 then Places a white dot at position (496, 63) then Places a purple line segment connecting (414, 160) to (395, 202).
; PLAN: r0=233(x), r1=17(y), r2=68(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x), r6=63(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=414(x1), r11=160(y1), r12=395(x2), r13=202(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 17
LDI r2, 68
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 63
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 414
LDI r11, 160
LDI r12, 395
LDI r13, 202
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
