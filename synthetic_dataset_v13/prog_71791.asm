; DESCRIPTION: Composite: Renders a blue disk with center (429, 209) and radius 21 then Renders a yellow line between points (359, 156) and (7, 81) then Creates a black rectangular region at (53, 91) spanning 48 by 92 pixels.
; PLAN: r0=429(x), r1=209(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x1), r6=156(y1), r7=7(x2), r8=81(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=91(y), r12=48(width), r13=92(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 209
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 156
LDI r7, 7
LDI r8, 81
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 91
LDI r12, 48
LDI r13, 92
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
