; DESCRIPTION: Composite: Places a blue line segment connecting (350, 76) to (446, 104) then Draws a blue circle centered at (442, 216) with radius 11.
; PLAN: r0=350(x1), r1=76(y1), r2=446(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=216(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 76
LDI r2, 446
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 216
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
