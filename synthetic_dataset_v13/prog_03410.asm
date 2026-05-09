; DESCRIPTION: Composite: Places a blue line segment connecting (180, 147) to (427, 20) then Places a purple circle of radius 33 at center (373, 190) then Renders a white box of size 113x17 starting at (279, 51).
; PLAN: r0=180(x1), r1=147(y1), r2=427(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=190(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=51(y), r12=113(width), r13=17(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 147
LDI r2, 427
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 190
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 51
LDI r12, 113
LDI r13, 17
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
