; DESCRIPTION: Composite: Draws a yellow rectangle at (225, 84) with width 82 and height 46 then Renders a blue disk with center (320, 58) and radius 54 then Renders a black line between points (262, 127) and (263, 225).
; PLAN: r0=225(x), r1=84(y), r2=82(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=58(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x1), r11=127(y1), r12=263(x2), r13=225(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 84
LDI r2, 82
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 58
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 127
LDI r12, 263
LDI r13, 225
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
