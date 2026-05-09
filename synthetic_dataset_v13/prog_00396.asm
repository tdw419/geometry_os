; DESCRIPTION: Composite: Places a yellow circle of radius 25 at center (222, 169) then Renders a white box of size 52x82 starting at (336, 81) then Places a purple line segment connecting (331, 248) to (349, 190).
; PLAN: r0=222(x), r1=169(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=81(y), r7=52(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x1), r11=248(y1), r12=349(x2), r13=190(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 169
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 81
LDI r7, 52
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 248
LDI r12, 349
LDI r13, 190
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
