; DESCRIPTION: Composite: Places a red line segment connecting (160, 209) to (194, 255) then Places a yellow dot at position (476, 54) then Draws a red rectangle at (331, 41) with width 38 and height 26.
; PLAN: r0=160(x1), r1=209(y1), r2=194(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=54(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=331(x), r11=41(y), r12=38(width), r13=26(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 209
LDI r2, 194
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 54
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 331
LDI r11, 41
LDI r12, 38
LDI r13, 26
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
