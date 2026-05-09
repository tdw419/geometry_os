; DESCRIPTION: Composite: Draws a purple circle centered at (293, 61) with radius 11 then Draws a black line from (363, 198) to (225, 71).
; PLAN: r0=293(x), r1=61(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x1), r6=198(y1), r7=225(x2), r8=71(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 61
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 198
LDI r7, 225
LDI r8, 71
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
