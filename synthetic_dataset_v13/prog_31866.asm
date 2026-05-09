; DESCRIPTION: Composite: Places a blue dot at position (98, 250) then Places a green line segment connecting (500, 222) to (86, 163) then Draws a orange circle centered at (389, 61) with radius 58.
; PLAN: r0=98(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=500(x1), r6=222(y1), r7=86(x2), r8=163(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=389(x), r11=61(y), r12=58(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 500
LDI r6, 222
LDI r7, 86
LDI r8, 163
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 61
LDI r12, 58
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
