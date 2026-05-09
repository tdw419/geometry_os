; DESCRIPTION: Composite: Places a magenta line segment connecting (495, 32) to (429, 147) then Sets a single yellow pixel at (404, 93) then Draws a green circle centered at (160, 99) with radius 51.
; PLAN: r0=495(x1), r1=32(y1), r2=429(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=93(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=99(y), r12=51(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 495
LDI r1, 32
LDI r2, 429
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 93
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 160
LDI r11, 99
LDI r12, 51
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
