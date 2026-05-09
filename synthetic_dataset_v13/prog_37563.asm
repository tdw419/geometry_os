; DESCRIPTION: Composite: Places a magenta dot at position (205, 145) then Draws a yellow line from (414, 209) to (60, 89) then Places a green circle of radius 72 at center (280, 159).
; PLAN: r0=205(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=209(y1), r7=60(x2), r8=89(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=159(y), r12=72(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 205
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 209
LDI r7, 60
LDI r8, 89
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 159
LDI r12, 72
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
