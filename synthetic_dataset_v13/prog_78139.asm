; DESCRIPTION: Composite: Creates a blue circular shape at (454, 121) with radius 40 then Places a black dot at position (235, 85) then Places a yellow line segment connecting (58, 27) to (501, 252).
; PLAN: r0=454(x), r1=121(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=85(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=58(x1), r11=27(y1), r12=501(x2), r13=252(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 121
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 85
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 58
LDI r11, 27
LDI r12, 501
LDI r13, 252
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
