; DESCRIPTION: Composite: Draws a orange line from (387, 204) to (478, 69) then Places a blue circle of radius 72 at center (150, 133) then Sets a single yellow pixel at (232, 34).
; PLAN: r0=387(x1), r1=204(y1), r2=478(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=133(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=232(x), r11=34(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 204
LDI r2, 478
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 133
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 232
LDI r11, 34
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
