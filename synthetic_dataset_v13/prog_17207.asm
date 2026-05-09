; DESCRIPTION: Composite: Draws a blue line from (349, 1) to (56, 104) then Places a black dot at position (327, 28) then Creates a purple circular shape at (64, 145) with radius 60.
; PLAN: r0=349(x1), r1=1(y1), r2=56(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=28(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=64(x), r11=145(y), r12=60(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 1
LDI r2, 56
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 28
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 64
LDI r11, 145
LDI r12, 60
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
