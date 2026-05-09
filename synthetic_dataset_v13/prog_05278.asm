; DESCRIPTION: Composite: Places a black line segment connecting (36, 22) to (115, 153) then Places a purple circle of radius 51 at center (183, 168).
; PLAN: r0=36(x1), r1=22(y1), r2=115(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=168(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 22
LDI r2, 115
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 168
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
