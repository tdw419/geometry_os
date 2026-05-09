; DESCRIPTION: Composite: Places a purple line segment connecting (322, 223) to (30, 55) then Draws a purple circle centered at (273, 165) with radius 40.
; PLAN: r0=322(x1), r1=223(y1), r2=30(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=165(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 223
LDI r2, 30
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 165
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
