; DESCRIPTION: Composite: Places a orange circle of radius 65 at center (291, 145) then Places a yellow dot at position (22, 124) then Draws a magenta line from (189, 99) to (464, 29).
; PLAN: r0=291(x), r1=145(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=124(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=189(x1), r11=99(y1), r12=464(x2), r13=29(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 145
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 124
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 189
LDI r11, 99
LDI r12, 464
LDI r13, 29
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
