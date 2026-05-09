; DESCRIPTION: Composite: Draws a magenta circle centered at (101, 147) with radius 48 then Sets a single orange pixel at (326, 227) then Draws a magenta line from (238, 165) to (388, 134).
; PLAN: r0=101(x), r1=147(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=227(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=238(x1), r11=165(y1), r12=388(x2), r13=134(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 147
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 227
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 238
LDI r11, 165
LDI r12, 388
LDI r13, 134
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
