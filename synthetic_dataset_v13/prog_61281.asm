; DESCRIPTION: Composite: Draws a green line from (430, 123) to (426, 230) then Creates a purple circular shape at (414, 186) with radius 58.
; PLAN: r0=430(x1), r1=123(y1), r2=426(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=186(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 430
LDI r1, 123
LDI r2, 426
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 186
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
