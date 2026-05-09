; DESCRIPTION: Composite: Creates a magenta circular shape at (319, 121) with radius 49 then Sets a single black pixel at (404, 218) then Renders a purple line between points (89, 135) and (13, 153).
; PLAN: r0=319(x), r1=121(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=218(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=89(x1), r11=135(y1), r12=13(x2), r13=153(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 121
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 218
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 89
LDI r11, 135
LDI r12, 13
LDI r13, 153
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
