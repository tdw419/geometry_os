; DESCRIPTION: Composite: Renders a purple box of size 72x91 starting at (426, 118) then Creates a red circular shape at (94, 137) with radius 72 then Places a red line segment connecting (147, 224) to (204, 30).
; PLAN: r0=426(x), r1=118(y), r2=72(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=137(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=147(x1), r11=224(y1), r12=204(x2), r13=30(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 118
LDI r2, 72
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 137
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 147
LDI r11, 224
LDI r12, 204
LDI r13, 30
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
