; DESCRIPTION: Composite: Places a black line segment connecting (271, 53) to (105, 58) then Places a purple circle of radius 52 at center (377, 131).
; PLAN: r0=271(x1), r1=53(y1), r2=105(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=131(y), r7=52(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 53
LDI r2, 105
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 131
LDI r7, 52
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
