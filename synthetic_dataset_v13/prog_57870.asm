; DESCRIPTION: Composite: Sets a single magenta pixel at (359, 176) then Places a black line segment connecting (302, 180) to (459, 247) then Renders a yellow disk with center (350, 73) and radius 67.
; PLAN: r0=359(x), r1=176(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=180(y1), r7=459(x2), r8=247(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=73(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 176
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 180
LDI r7, 459
LDI r8, 247
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 73
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
