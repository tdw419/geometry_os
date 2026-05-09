; DESCRIPTION: Composite: Renders a purple line between points (57, 178) and (503, 89) then Places a magenta circle of radius 52 at center (383, 88).
; PLAN: r0=57(x1), r1=178(y1), r2=503(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=88(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 178
LDI r2, 503
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 88
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
