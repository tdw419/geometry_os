; DESCRIPTION: Composite: Places a green circle of radius 14 at center (428, 66) then Places a black line segment connecting (194, 17) to (318, 114).
; PLAN: r0=428(x), r1=66(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x1), r6=17(y1), r7=318(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 66
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 17
LDI r7, 318
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
