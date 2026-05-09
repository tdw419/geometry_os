; DESCRIPTION: Composite: Renders a yellow line between points (30, 65) and (326, 119) then Renders a purple disk with center (107, 177) and radius 36.
; PLAN: r0=30(x1), r1=65(y1), r2=326(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=177(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 65
LDI r2, 326
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 177
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
