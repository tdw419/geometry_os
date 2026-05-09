; DESCRIPTION: Composite: Sets a single red pixel at (315, 99) then Renders a black line between points (371, 45) and (37, 231) then Draws a red circle centered at (142, 85) with radius 29.
; PLAN: r0=315(x), r1=99(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=371(x1), r6=45(y1), r7=37(x2), r8=231(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=85(y), r12=29(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 99
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 371
LDI r6, 45
LDI r7, 37
LDI r8, 231
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 85
LDI r12, 29
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
