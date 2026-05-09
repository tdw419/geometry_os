; DESCRIPTION: Composite: Renders a green line between points (51, 235) and (489, 189) then Places a white dot at position (428, 229) then Creates a magenta circular shape at (183, 117) with radius 75.
; PLAN: r0=51(x1), r1=235(y1), r2=489(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=229(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=183(x), r11=117(y), r12=75(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 235
LDI r2, 489
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 229
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 183
LDI r11, 117
LDI r12, 75
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
