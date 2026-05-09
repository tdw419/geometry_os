; DESCRIPTION: Composite: Places a black line segment connecting (363, 253) to (490, 114) then Renders a yellow disk with center (377, 94) and radius 65.
; PLAN: r0=363(x1), r1=253(y1), r2=490(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=94(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 253
LDI r2, 490
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 94
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
