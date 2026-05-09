; DESCRIPTION: Composite: Draws a black line from (326, 223) to (284, 112) then Draws a black circle centered at (368, 50) with radius 14 then Creates a black rectangular region at (147, 0) spanning 112 by 15 pixels.
; PLAN: r0=326(x1), r1=223(y1), r2=284(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=50(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=147(x), r11=0(y), r12=112(width), r13=15(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 223
LDI r2, 284
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 50
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 147
LDI r11, 0
LDI r12, 112
LDI r13, 15
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
