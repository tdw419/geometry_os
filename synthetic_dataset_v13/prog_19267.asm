; DESCRIPTION: Composite: Renders a black disk with center (72, 91) and radius 16 then Sets a single black pixel at (337, 204) then Draws a blue line from (259, 223) to (72, 130).
; PLAN: r0=72(x), r1=91(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x), r6=204(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=259(x1), r11=223(y1), r12=72(x2), r13=130(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 91
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 204
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 259
LDI r11, 223
LDI r12, 72
LDI r13, 130
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
