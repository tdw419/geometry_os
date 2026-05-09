; DESCRIPTION: Composite: Draws a black circle centered at (471, 147) with radius 39 then Sets a single red pixel at (252, 81) then Renders a green line between points (240, 148) and (243, 13).
; PLAN: r0=471(x), r1=147(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=81(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=240(x1), r11=148(y1), r12=243(x2), r13=13(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 147
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 81
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 240
LDI r11, 148
LDI r12, 243
LDI r13, 13
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
