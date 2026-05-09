; DESCRIPTION: Composite: Draws a cyan line from (206, 40) to (183, 127) then Sets a single black pixel at (349, 153) then Creates a yellow circular shape at (132, 150) with radius 73.
; PLAN: r0=206(x1), r1=40(y1), r2=183(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=153(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=150(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 40
LDI r2, 183
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 153
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 132
LDI r11, 150
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
