; DESCRIPTION: Composite: Draws a yellow line from (447, 60) to (454, 74) then Places a purple dot at position (388, 230) then Places a red circle of radius 49 at center (343, 104).
; PLAN: r0=447(x1), r1=60(y1), r2=454(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=230(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=343(x), r11=104(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 447
LDI r1, 60
LDI r2, 454
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 230
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 343
LDI r11, 104
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
