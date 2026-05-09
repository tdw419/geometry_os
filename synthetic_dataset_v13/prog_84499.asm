; DESCRIPTION: Composite: Sets a single yellow pixel at (29, 35) then Creates a blue circular shape at (403, 45) with radius 38 then Places a orange line segment connecting (472, 159) to (135, 15).
; PLAN: r0=29(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=45(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=472(x1), r11=159(y1), r12=135(x2), r13=15(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 35
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 403
LDI r6, 45
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 472
LDI r11, 159
LDI r12, 135
LDI r13, 15
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
