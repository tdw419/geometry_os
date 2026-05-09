; DESCRIPTION: Composite: Places a red dot at position (393, 225) then Places a blue line segment connecting (62, 179) to (237, 243) then Draws a green circle centered at (107, 175) with radius 40.
; PLAN: r0=393(x), r1=225(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=62(x1), r6=179(y1), r7=237(x2), r8=243(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=175(y), r12=40(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 225
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 62
LDI r6, 179
LDI r7, 237
LDI r8, 243
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 175
LDI r12, 40
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
