; DESCRIPTION: Composite: Renders a blue box of size 39x12 starting at (347, 167) then Draws a blue line from (62, 152) to (420, 241) then Renders a black disk with center (278, 113) and radius 42.
; PLAN: r0=347(x), r1=167(y), r2=39(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x1), r6=152(y1), r7=420(x2), r8=241(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=278(x), r11=113(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 167
LDI r2, 39
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 152
LDI r7, 420
LDI r8, 241
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 113
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
