; DESCRIPTION: Composite: Renders a purple line between points (84, 80) and (118, 202) then Places a black circle of radius 34 at center (163, 71).
; PLAN: r0=84(x1), r1=80(y1), r2=118(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=71(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 84
LDI r1, 80
LDI r2, 118
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 71
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
