; DESCRIPTION: Composite: Places a blue line segment connecting (60, 138) to (347, 162) then Draws a yellow circle centered at (407, 51) with radius 40.
; PLAN: r0=60(x1), r1=138(y1), r2=347(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=51(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 138
LDI r2, 347
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 51
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
