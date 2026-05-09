; DESCRIPTION: Composite: Draws a black circle centered at (172, 155) with radius 10 then Places a purple dot at position (412, 221) then Places a green line segment connecting (234, 155) to (185, 132).
; PLAN: r0=172(x), r1=155(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=221(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=234(x1), r11=155(y1), r12=185(x2), r13=132(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 155
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 221
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 234
LDI r11, 155
LDI r12, 185
LDI r13, 132
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
