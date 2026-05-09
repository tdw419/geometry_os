; DESCRIPTION: Composite: Places a black line segment connecting (479, 17) to (355, 110) then Places a orange dot at position (285, 54) then Draws a purple rectangle at (461, 2) with width 36 and height 101.
; PLAN: r0=479(x1), r1=17(y1), r2=355(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=461(x), r11=2(y), r12=36(width), r13=101(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 17
LDI r2, 355
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 461
LDI r11, 2
LDI r12, 36
LDI r13, 101
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
