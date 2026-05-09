; DESCRIPTION: Composite: Places a blue line segment connecting (442, 140) to (427, 111) then Draws a purple circle centered at (192, 112) with radius 30 then Places a black dot at position (124, 238).
; PLAN: r0=442(x1), r1=140(y1), r2=427(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=112(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=124(x), r11=238(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 442
LDI r1, 140
LDI r2, 427
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 112
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 124
LDI r11, 238
LDI r12, 0x000000
PSET r10, r11, r12
HALT
