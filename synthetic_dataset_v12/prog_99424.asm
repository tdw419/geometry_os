; DESCRIPTION: Composite: Sets a single black pixel at (278, 85) then Renders a blue line between points (86, 24) and (226, 67) then Draws a blue circle centered at (310, 119) with radius 79.
; PLAN: r0=278(x), r1=85(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=24(y1), r7=226(x2), r8=67(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=119(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 85
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 86
LDI r6, 24
LDI r7, 226
LDI r8, 67
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 119
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
