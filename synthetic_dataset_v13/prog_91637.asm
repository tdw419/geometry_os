; DESCRIPTION: Composite: Places a black line segment connecting (2, 49) to (87, 131) then Creates a purple circular shape at (145, 93) with radius 29.
; PLAN: r0=2(x1), r1=49(y1), r2=87(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=93(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 49
LDI r2, 87
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 93
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
