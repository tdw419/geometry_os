; DESCRIPTION: Composite: Draws a purple circle centered at (349, 133) with radius 22 then Draws a black line from (104, 171) to (339, 63).
; PLAN: r0=349(x), r1=133(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=171(y1), r7=339(x2), r8=63(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 133
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 171
LDI r7, 339
LDI r8, 63
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
