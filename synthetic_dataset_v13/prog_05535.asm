; DESCRIPTION: Composite: Draws a white line from (259, 155) to (276, 9) then Draws a purple circle centered at (248, 112) with radius 25.
; PLAN: r0=259(x1), r1=155(y1), r2=276(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=112(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 155
LDI r2, 276
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 112
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
