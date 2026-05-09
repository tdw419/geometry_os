; DESCRIPTION: Composite: Renders a white disk with center (408, 140) and radius 17 then Sets a single orange pixel at (343, 103) then Draws a purple line from (59, 189) to (151, 135).
; PLAN: r0=408(x), r1=140(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=103(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=59(x1), r11=189(y1), r12=151(x2), r13=135(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 140
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 103
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 59
LDI r11, 189
LDI r12, 151
LDI r13, 135
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
