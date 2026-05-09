; DESCRIPTION: Composite: Renders a purple disk with center (336, 104) and radius 80 then Renders a purple line between points (201, 190) and (398, 237).
; PLAN: r0=336(x), r1=104(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x1), r6=190(y1), r7=398(x2), r8=237(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 104
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 190
LDI r7, 398
LDI r8, 237
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
