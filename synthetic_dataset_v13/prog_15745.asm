; DESCRIPTION: Composite: Places a purple line segment connecting (209, 253) to (124, 49) then Creates a blue circular shape at (202, 170) with radius 78.
; PLAN: r0=209(x1), r1=253(y1), r2=124(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=170(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 253
LDI r2, 124
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 170
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
