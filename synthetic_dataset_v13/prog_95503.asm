; DESCRIPTION: Composite: Renders a blue line between points (409, 48) and (312, 14) then Draws a yellow circle centered at (235, 138) with radius 47.
; PLAN: r0=409(x1), r1=48(y1), r2=312(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=138(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 409
LDI r1, 48
LDI r2, 312
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 138
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
