; DESCRIPTION: Composite: Draws a purple line from (250, 144) to (88, 114) then Draws a purple circle centered at (216, 124) with radius 37.
; PLAN: r0=250(x1), r1=144(y1), r2=88(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=124(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 144
LDI r2, 88
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 124
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
