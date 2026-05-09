; DESCRIPTION: Composite: Draws a red circle centered at (300, 182) with radius 30 then Sets a single blue pixel at (74, 244) then Draws a red line from (109, 142) to (494, 175).
; PLAN: r0=300(x), r1=182(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=244(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=109(x1), r11=142(y1), r12=494(x2), r13=175(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 182
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 244
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 109
LDI r11, 142
LDI r12, 494
LDI r13, 175
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
