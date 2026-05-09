; DESCRIPTION: Composite: Draws a blue line from (162, 209) to (374, 12) then Places a black dot at position (436, 199) then Places a orange circle of radius 61 at center (149, 104).
; PLAN: r0=162(x1), r1=209(y1), r2=374(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=149(x), r11=104(y), r12=61(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 162
LDI r1, 209
LDI r2, 374
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 149
LDI r11, 104
LDI r12, 61
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
