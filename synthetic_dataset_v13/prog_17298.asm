; DESCRIPTION: Composite: Draws a red circle centered at (121, 84) with radius 38 then Places a purple dot at position (190, 116) then Draws a purple line from (347, 182) to (449, 163).
; PLAN: r0=121(x), r1=84(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=116(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=347(x1), r11=182(y1), r12=449(x2), r13=163(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 84
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 116
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 347
LDI r11, 182
LDI r12, 449
LDI r13, 163
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
