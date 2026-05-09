; DESCRIPTION: Composite: Places a green line segment connecting (24, 171) to (430, 222) then Places a purple dot at position (373, 203) then Draws a yellow circle centered at (356, 82) with radius 51.
; PLAN: r0=24(x1), r1=171(y1), r2=430(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=203(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=356(x), r11=82(y), r12=51(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 171
LDI r2, 430
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 203
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 356
LDI r11, 82
LDI r12, 51
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
