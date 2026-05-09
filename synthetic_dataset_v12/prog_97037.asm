; DESCRIPTION: Composite: Draws a orange circle centered at (166, 150) with radius 24 then Sets a single orange pixel at (123, 115) then Renders a magenta line between points (271, 132) and (390, 32).
; PLAN: r0=166(x), r1=150(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x), r6=115(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=271(x1), r11=132(y1), r12=390(x2), r13=32(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 150
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 115
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 271
LDI r11, 132
LDI r12, 390
LDI r13, 32
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
