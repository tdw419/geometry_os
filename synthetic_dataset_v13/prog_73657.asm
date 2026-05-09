; DESCRIPTION: Composite: Draws a purple circle centered at (385, 170) with radius 50 then Sets a single magenta pixel at (79, 244) then Places a orange line segment connecting (184, 245) to (434, 92).
; PLAN: r0=385(x), r1=170(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=244(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=184(x1), r11=245(y1), r12=434(x2), r13=92(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 170
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 244
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 184
LDI r11, 245
LDI r12, 434
LDI r13, 92
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
