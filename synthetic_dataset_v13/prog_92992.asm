; DESCRIPTION: Composite: Sets a single yellow pixel at (196, 4) then Places a orange line segment connecting (123, 71) to (404, 246) then Creates a blue circular shape at (310, 28) with radius 15.
; PLAN: r0=196(x), r1=4(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=123(x1), r6=71(y1), r7=404(x2), r8=246(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=28(y), r12=15(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 4
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 123
LDI r6, 71
LDI r7, 404
LDI r8, 246
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 28
LDI r12, 15
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
