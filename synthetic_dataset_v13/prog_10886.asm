; DESCRIPTION: Composite: Sets a single orange pixel at (232, 80) then Draws a black circle centered at (314, 91) with radius 38 then Places a yellow line segment connecting (332, 21) to (69, 95).
; PLAN: r0=232(x), r1=80(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=91(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x1), r11=21(y1), r12=69(x2), r13=95(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 80
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 314
LDI r6, 91
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 21
LDI r12, 69
LDI r13, 95
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
