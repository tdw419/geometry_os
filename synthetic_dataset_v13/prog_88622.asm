; DESCRIPTION: Composite: Draws a red circle centered at (132, 207) with radius 38 then Places a blue dot at position (400, 177) then Places a magenta line segment connecting (181, 169) to (414, 97).
; PLAN: r0=132(x), r1=207(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=177(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=181(x1), r11=169(y1), r12=414(x2), r13=97(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 207
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 177
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 181
LDI r11, 169
LDI r12, 414
LDI r13, 97
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
