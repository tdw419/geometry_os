; DESCRIPTION: Composite: Renders a magenta disk with center (317, 102) and radius 61 then Draws a orange rectangle at (32, 217) with width 18 and height 33 then Places a black line segment connecting (501, 163) to (435, 150).
; PLAN: r0=317(x), r1=102(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=217(y), r7=18(width), r8=33(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=501(x1), r11=163(y1), r12=435(x2), r13=150(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 102
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 217
LDI r7, 18
LDI r8, 33
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 163
LDI r12, 435
LDI r13, 150
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
