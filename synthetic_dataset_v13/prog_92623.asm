; DESCRIPTION: Composite: Draws a purple circle centered at (166, 122) with radius 64 then Sets a single cyan pixel at (20, 98) then Places a blue line segment connecting (94, 21) to (496, 74).
; PLAN: r0=166(x), r1=122(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=98(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=94(x1), r11=21(y1), r12=496(x2), r13=74(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 122
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 98
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 94
LDI r11, 21
LDI r12, 496
LDI r13, 74
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
