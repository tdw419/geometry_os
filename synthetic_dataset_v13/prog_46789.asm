; DESCRIPTION: Composite: Draws a yellow rectangle at (256, 37) with width 109 and height 102 then Renders a black line between points (318, 7) and (443, 135) then Renders a green disk with center (241, 45) and radius 21.
; PLAN: r0=256(x), r1=37(y), r2=109(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x1), r6=7(y1), r7=443(x2), r8=135(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=45(y), r12=21(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 37
LDI r2, 109
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 7
LDI r7, 443
LDI r8, 135
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 45
LDI r12, 21
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
