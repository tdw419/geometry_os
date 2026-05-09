; DESCRIPTION: Composite: Sets a single black pixel at (166, 149) then Renders a blue line between points (310, 67) and (447, 127) then Draws a black circle centered at (127, 100) with radius 23.
; PLAN: r0=166(x), r1=149(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=67(y1), r7=447(x2), r8=127(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=127(x), r11=100(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 149
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 310
LDI r6, 67
LDI r7, 447
LDI r8, 127
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 100
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
