; DESCRIPTION: Composite: Draws a black line from (190, 186) to (129, 170) then Places a purple circle of radius 77 at center (171, 147).
; PLAN: r0=190(x1), r1=186(y1), r2=129(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=147(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 190
LDI r1, 186
LDI r2, 129
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 147
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
