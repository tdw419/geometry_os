; DESCRIPTION: Composite: Places a magenta line segment connecting (134, 11) to (436, 136) then Places a cyan dot at position (85, 222) then Draws a cyan circle centered at (438, 88) with radius 12.
; PLAN: r0=134(x1), r1=11(y1), r2=436(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=222(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=438(x), r11=88(y), r12=12(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 11
LDI r2, 436
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 222
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 438
LDI r11, 88
LDI r12, 12
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
