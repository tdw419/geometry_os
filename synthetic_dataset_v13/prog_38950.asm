; DESCRIPTION: Composite: Sets a single cyan pixel at (122, 79) then Draws a blue line from (139, 85) to (414, 103) then Draws a blue circle centered at (232, 181) with radius 67.
; PLAN: r0=122(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=85(y1), r7=414(x2), r8=103(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=181(y), r12=67(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 79
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 85
LDI r7, 414
LDI r8, 103
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 181
LDI r12, 67
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
