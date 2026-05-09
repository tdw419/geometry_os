; DESCRIPTION: Composite: Draws a yellow circle centered at (315, 96) with radius 17 then Draws a purple line from (80, 184) to (454, 98).
; PLAN: r0=315(x), r1=96(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x1), r6=184(y1), r7=454(x2), r8=98(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 96
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 184
LDI r7, 454
LDI r8, 98
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
