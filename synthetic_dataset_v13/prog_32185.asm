; DESCRIPTION: Composite: Sets a single purple pixel at (230, 84) then Draws a yellow circle centered at (205, 107) with radius 10 then Places a orange line segment connecting (395, 252) to (85, 236).
; PLAN: r0=230(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=107(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=395(x1), r11=252(y1), r12=85(x2), r13=236(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 205
LDI r6, 107
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 395
LDI r11, 252
LDI r12, 85
LDI r13, 236
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
