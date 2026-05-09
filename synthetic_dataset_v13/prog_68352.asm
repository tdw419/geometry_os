; DESCRIPTION: Composite: Places a green line segment connecting (510, 120) to (232, 142) then Places a purple circle of radius 74 at center (170, 115).
; PLAN: r0=510(x1), r1=120(y1), r2=232(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=115(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 510
LDI r1, 120
LDI r2, 232
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 115
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
