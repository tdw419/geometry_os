; DESCRIPTION: Composite: Places a green dot at position (422, 188) then Renders a yellow disk with center (99, 75) and radius 35 then Draws a green line from (88, 104) to (489, 87).
; PLAN: r0=422(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=75(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x1), r11=104(y1), r12=489(x2), r13=87(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 99
LDI r6, 75
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 104
LDI r12, 489
LDI r13, 87
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
