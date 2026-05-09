; DESCRIPTION: Composite: Renders a red disk with center (304, 150) and radius 31 then Draws a yellow rectangle at (320, 159) with width 51 and height 62 then Renders a red line between points (469, 206) and (355, 41).
; PLAN: r0=304(x), r1=150(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=159(y), r7=51(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x1), r11=206(y1), r12=355(x2), r13=41(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 150
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 159
LDI r7, 51
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 206
LDI r12, 355
LDI r13, 41
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
