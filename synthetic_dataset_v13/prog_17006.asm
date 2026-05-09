; DESCRIPTION: Composite: Renders a blue line between points (483, 218) and (45, 4) then Places a green dot at position (80, 169) then Draws a red circle centered at (255, 184) with radius 25.
; PLAN: r0=483(x1), r1=218(y1), r2=45(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=169(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=255(x), r11=184(y), r12=25(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 483
LDI r1, 218
LDI r2, 45
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 169
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 255
LDI r11, 184
LDI r12, 25
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
