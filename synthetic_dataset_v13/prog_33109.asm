; DESCRIPTION: Composite: Renders a blue line between points (136, 80) and (219, 42) then Creates a purple rectangular region at (350, 177) spanning 26 by 17 pixels then Places a red circle of radius 17 at center (43, 224).
; PLAN: r0=136(x1), r1=80(y1), r2=219(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=177(y), r7=26(width), r8=17(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=43(x), r11=224(y), r12=17(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 80
LDI r2, 219
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 177
LDI r7, 26
LDI r8, 17
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 224
LDI r12, 17
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
