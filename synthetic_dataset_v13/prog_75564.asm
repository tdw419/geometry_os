; DESCRIPTION: Composite: Places a green dot at position (119, 218) then Creates a magenta circular shape at (200, 131) with radius 68 then Draws a yellow line from (319, 70) to (325, 107).
; PLAN: r0=119(x), r1=218(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=131(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=319(x1), r11=70(y1), r12=325(x2), r13=107(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 218
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 200
LDI r6, 131
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 319
LDI r11, 70
LDI r12, 325
LDI r13, 107
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
