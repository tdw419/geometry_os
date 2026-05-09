; DESCRIPTION: Composite: Renders a white line between points (58, 155) and (28, 235) then Draws a yellow circle centered at (376, 174) with radius 78.
; PLAN: r0=58(x1), r1=155(y1), r2=28(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=174(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 155
LDI r2, 28
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 174
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
