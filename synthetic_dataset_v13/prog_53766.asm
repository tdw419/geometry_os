; DESCRIPTION: Composite: Draws a red circle centered at (317, 149) with radius 49 then Places a black dot at position (121, 101) then Places a purple line segment connecting (77, 184) to (370, 101).
; PLAN: r0=317(x), r1=149(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=101(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=77(x1), r11=184(y1), r12=370(x2), r13=101(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 149
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 101
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 77
LDI r11, 184
LDI r12, 370
LDI r13, 101
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
