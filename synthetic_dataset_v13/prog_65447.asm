; DESCRIPTION: Composite: Renders a purple disk with center (287, 151) and radius 74 then Renders a white line between points (497, 116) and (110, 49).
; PLAN: r0=287(x), r1=151(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x1), r6=116(y1), r7=110(x2), r8=49(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 151
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 116
LDI r7, 110
LDI r8, 49
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
