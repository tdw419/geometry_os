; DESCRIPTION: Composite: Draws a orange circle centered at (321, 170) with radius 42 then Places a purple dot at position (321, 189) then Renders a purple line between points (219, 123) and (181, 1).
; PLAN: r0=321(x), r1=170(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=189(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=219(x1), r11=123(y1), r12=181(x2), r13=1(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 170
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 189
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 219
LDI r11, 123
LDI r12, 181
LDI r13, 1
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
