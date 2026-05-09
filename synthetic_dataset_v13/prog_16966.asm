; DESCRIPTION: Composite: Sets a single cyan pixel at (424, 227) then Draws a yellow circle centered at (336, 181) with radius 13 then Places a red line segment connecting (440, 137) to (59, 105).
; PLAN: r0=424(x), r1=227(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=181(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x1), r11=137(y1), r12=59(x2), r13=105(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 227
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 336
LDI r6, 181
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 137
LDI r12, 59
LDI r13, 105
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
