; DESCRIPTION: Composite: Draws a black circle centered at (360, 80) with radius 72 then Sets a single purple pixel at (430, 29) then Places a green line segment connecting (464, 111) to (62, 110).
; PLAN: r0=360(x), r1=80(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=29(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=464(x1), r11=111(y1), r12=62(x2), r13=110(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 80
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 29
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 464
LDI r11, 111
LDI r12, 62
LDI r13, 110
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
