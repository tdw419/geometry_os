; DESCRIPTION: Composite: Places a blue dot at position (145, 80) then Draws a black circle centered at (407, 106) with radius 12 then Renders a black line between points (467, 240) and (58, 244).
; PLAN: r0=145(x), r1=80(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=106(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=467(x1), r11=240(y1), r12=58(x2), r13=244(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 80
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 106
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 467
LDI r11, 240
LDI r12, 58
LDI r13, 244
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
