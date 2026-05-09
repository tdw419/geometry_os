; DESCRIPTION: Composite: Draws a magenta line from (290, 254) to (268, 111) then Sets a single blue pixel at (36, 191) then Places a yellow circle of radius 25 at center (264, 98).
; PLAN: r0=290(x1), r1=254(y1), r2=268(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=191(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=264(x), r11=98(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 254
LDI r2, 268
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 191
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 264
LDI r11, 98
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
