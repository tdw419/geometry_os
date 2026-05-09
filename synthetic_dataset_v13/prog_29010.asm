; DESCRIPTION: Composite: Creates a magenta circular shape at (350, 72) with radius 52 then Sets a single blue pixel at (451, 189) then Draws a yellow line from (262, 203) to (332, 210).
; PLAN: r0=350(x), r1=72(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=189(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=262(x1), r11=203(y1), r12=332(x2), r13=210(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 72
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 189
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 262
LDI r11, 203
LDI r12, 332
LDI r13, 210
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
