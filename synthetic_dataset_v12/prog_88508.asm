; DESCRIPTION: Composite: Renders a magenta box of size 30x55 starting at (175, 154) then Renders a yellow line between points (236, 140) and (466, 240) then Creates a black circular shape at (198, 71) with radius 51.
; PLAN: r0=175(x), r1=154(y), r2=30(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=140(y1), r7=466(x2), r8=240(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=71(y), r12=51(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 154
LDI r2, 30
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 140
LDI r7, 466
LDI r8, 240
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 71
LDI r12, 51
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
