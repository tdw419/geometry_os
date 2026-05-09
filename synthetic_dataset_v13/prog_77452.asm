; DESCRIPTION: Composite: Draws a blue line from (376, 72) to (58, 223) then Draws a purple circle centered at (105, 109) with radius 36.
; PLAN: r0=376(x1), r1=72(y1), r2=58(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=109(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 72
LDI r2, 58
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 109
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
