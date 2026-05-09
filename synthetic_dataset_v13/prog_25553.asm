; DESCRIPTION: Composite: Places a yellow dot at position (277, 7) then Renders a magenta disk with center (448, 159) and radius 23 then Places a magenta line segment connecting (278, 201) to (3, 23).
; PLAN: r0=277(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=159(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=278(x1), r11=201(y1), r12=3(x2), r13=23(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 7
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 448
LDI r6, 159
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 278
LDI r11, 201
LDI r12, 3
LDI r13, 23
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
