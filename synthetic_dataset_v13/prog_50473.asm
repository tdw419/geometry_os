; DESCRIPTION: Composite: Draws a orange circle centered at (218, 125) with radius 10 then Places a blue dot at position (350, 141) then Renders a yellow line between points (375, 13) and (45, 58).
; PLAN: r0=218(x), r1=125(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=141(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=375(x1), r11=13(y1), r12=45(x2), r13=58(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 125
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 141
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 375
LDI r11, 13
LDI r12, 45
LDI r13, 58
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
