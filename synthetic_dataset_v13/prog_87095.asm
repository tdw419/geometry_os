; DESCRIPTION: Composite: Draws a purple line from (259, 154) to (250, 163) then Renders a white disk with center (65, 180) and radius 65 then Draws a black rectangle at (236, 140) with width 40 and height 19.
; PLAN: r0=259(x1), r1=154(y1), r2=250(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=180(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x), r11=140(y), r12=40(width), r13=19(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 154
LDI r2, 250
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 180
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 140
LDI r12, 40
LDI r13, 19
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
