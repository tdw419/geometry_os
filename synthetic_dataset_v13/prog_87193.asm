; DESCRIPTION: Composite: Places a blue line segment connecting (324, 36) to (222, 201) then Draws a black circle centered at (51, 208) with radius 44 then Places a yellow dot at position (140, 56).
; PLAN: r0=324(x1), r1=36(y1), r2=222(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=208(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=56(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 324
LDI r1, 36
LDI r2, 222
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 208
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 56
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
