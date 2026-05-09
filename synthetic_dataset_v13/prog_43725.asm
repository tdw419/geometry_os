; DESCRIPTION: Composite: Draws a black line from (453, 174) to (0, 247) then Sets a single black pixel at (451, 174) then Renders a magenta disk with center (370, 162) and radius 42.
; PLAN: r0=453(x1), r1=174(y1), r2=0(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=451(x), r6=174(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=370(x), r11=162(y), r12=42(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 174
LDI r2, 0
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 174
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 370
LDI r11, 162
LDI r12, 42
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
