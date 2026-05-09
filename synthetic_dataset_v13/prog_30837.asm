; DESCRIPTION: Composite: Sets a single purple pixel at (291, 71) then Draws a orange circle centered at (359, 148) with radius 33 then Places a blue line segment connecting (266, 230) to (3, 197).
; PLAN: r0=291(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=148(y), r7=33(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=266(x1), r11=230(y1), r12=3(x2), r13=197(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 148
LDI r7, 33
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 266
LDI r11, 230
LDI r12, 3
LDI r13, 197
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
