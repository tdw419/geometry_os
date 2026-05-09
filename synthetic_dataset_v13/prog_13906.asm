; DESCRIPTION: Composite: Places a black circle of radius 58 at center (330, 187) then Draws a blue line from (138, 86) to (463, 112) then Sets a single red pixel at (253, 106).
; PLAN: r0=330(x), r1=187(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x1), r6=86(y1), r7=463(x2), r8=112(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=106(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 187
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 86
LDI r7, 463
LDI r8, 112
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 106
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
