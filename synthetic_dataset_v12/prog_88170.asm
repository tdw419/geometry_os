; DESCRIPTION: Composite: Places a red line segment connecting (17, 211) to (101, 253) then Renders a purple disk with center (132, 78) and radius 66.
; PLAN: r0=17(x1), r1=211(y1), r2=101(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=78(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 17
LDI r1, 211
LDI r2, 101
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 78
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
