; DESCRIPTION: Composite: Draws a blue circle centered at (261, 101) with radius 35 then Renders a blue line between points (338, 77) and (372, 129).
; PLAN: r0=261(x), r1=101(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x1), r6=77(y1), r7=372(x2), r8=129(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 101
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 77
LDI r7, 372
LDI r8, 129
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
