; DESCRIPTION: Composite: Renders a red line between points (330, 191) and (301, 121) then Sets a single green pixel at (490, 22) then Draws a black circle centered at (257, 165) with radius 60.
; PLAN: r0=330(x1), r1=191(y1), r2=301(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=490(x), r6=22(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=165(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 191
LDI r2, 301
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 22
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 257
LDI r11, 165
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
