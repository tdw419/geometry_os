; DESCRIPTION: Composite: Creates a blue circular shape at (254, 109) with radius 55 then Renders a purple line between points (235, 141) and (78, 58).
; PLAN: r0=254(x), r1=109(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x1), r6=141(y1), r7=78(x2), r8=58(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 109
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 141
LDI r7, 78
LDI r8, 58
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
