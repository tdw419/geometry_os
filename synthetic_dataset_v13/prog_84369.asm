; DESCRIPTION: Composite: Renders a magenta disk with center (317, 200) and radius 21 then Creates a purple rectangular region at (241, 187) spanning 110 by 64 pixels then Places a yellow line segment connecting (339, 182) to (374, 88).
; PLAN: r0=317(x), r1=200(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=187(y), r7=110(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x1), r11=182(y1), r12=374(x2), r13=88(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 200
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 187
LDI r7, 110
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 182
LDI r12, 374
LDI r13, 88
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
