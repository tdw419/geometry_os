; DESCRIPTION: Composite: Places a magenta line segment connecting (307, 155) to (272, 147) then Sets a single red pixel at (462, 225) then Draws a white circle centered at (165, 69) with radius 32.
; PLAN: r0=307(x1), r1=155(y1), r2=272(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=225(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=69(y), r12=32(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 155
LDI r2, 272
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 225
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 165
LDI r11, 69
LDI r12, 32
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
