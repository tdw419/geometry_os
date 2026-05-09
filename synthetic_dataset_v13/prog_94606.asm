; DESCRIPTION: Composite: Draws a white circle centered at (347, 93) with radius 62 then Draws a purple line from (112, 147) to (128, 92).
; PLAN: r0=347(x), r1=93(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=147(y1), r7=128(x2), r8=92(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 93
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 147
LDI r7, 128
LDI r8, 92
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
