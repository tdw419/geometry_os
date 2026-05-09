; DESCRIPTION: Composite: Places a orange line segment connecting (165, 146) to (36, 193) then Places a yellow dot at position (504, 72) then Draws a black circle centered at (314, 54) with radius 46.
; PLAN: r0=165(x1), r1=146(y1), r2=36(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=504(x), r6=72(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=54(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 146
LDI r2, 36
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 72
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 314
LDI r11, 54
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
