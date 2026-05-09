; DESCRIPTION: Composite: Places a blue line segment connecting (17, 14) to (419, 81) then Places a red circle of radius 52 at center (64, 179).
; PLAN: r0=17(x1), r1=14(y1), r2=419(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=179(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 17
LDI r1, 14
LDI r2, 419
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 179
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
