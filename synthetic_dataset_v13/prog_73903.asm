; DESCRIPTION: Composite: Renders a magenta disk with center (181, 108) and radius 48 then Renders a black line between points (170, 153) and (71, 58) then Draws a white rectangle at (81, 60) with width 43 and height 55.
; PLAN: r0=181(x), r1=108(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x1), r6=153(y1), r7=71(x2), r8=58(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=60(y), r12=43(width), r13=55(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 108
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 153
LDI r7, 71
LDI r8, 58
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 60
LDI r12, 43
LDI r13, 55
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
