; DESCRIPTION: Composite: Sets a single blue pixel at (291, 24) then Draws a magenta rectangle at (24, 112) with width 110 and height 76 then Places a orange line segment connecting (164, 155) to (462, 12).
; PLAN: r0=291(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=112(y), r7=110(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x1), r11=155(y1), r12=462(x2), r13=12(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 112
LDI r7, 110
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 155
LDI r12, 462
LDI r13, 12
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
