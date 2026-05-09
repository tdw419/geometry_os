; DESCRIPTION: Composite: Places a blue dot at position (213, 97) then Places a purple line segment connecting (377, 62) to (149, 135) then Draws a purple circle centered at (300, 184) with radius 25.
; PLAN: r0=213(x), r1=97(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=377(x1), r6=62(y1), r7=149(x2), r8=135(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=184(y), r12=25(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 97
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 377
LDI r6, 62
LDI r7, 149
LDI r8, 135
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 184
LDI r12, 25
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
