; DESCRIPTION: Composite: Draws a yellow line from (250, 252) to (389, 214) then Draws a yellow circle centered at (327, 181) with radius 17.
; PLAN: r0=250(x1), r1=252(y1), r2=389(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=181(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 252
LDI r2, 389
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 181
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
