; DESCRIPTION: Composite: Renders a orange disk with center (124, 127) and radius 10 then Places a red dot at position (167, 55) then Places a black line segment connecting (451, 21) to (472, 254).
; PLAN: r0=124(x), r1=127(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=55(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=451(x1), r11=21(y1), r12=472(x2), r13=254(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 127
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 55
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 451
LDI r11, 21
LDI r12, 472
LDI r13, 254
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
