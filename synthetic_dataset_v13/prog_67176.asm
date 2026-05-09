; DESCRIPTION: Composite: Draws a black line from (40, 2) to (86, 74) then Creates a purple circular shape at (322, 34) with radius 20.
; PLAN: r0=40(x1), r1=2(y1), r2=86(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=34(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 40
LDI r1, 2
LDI r2, 86
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 34
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
