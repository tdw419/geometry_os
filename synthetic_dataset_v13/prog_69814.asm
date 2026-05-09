; DESCRIPTION: Composite: Renders a purple line between points (39, 4) and (468, 245) then Renders a purple disk with center (61, 102) and radius 34.
; PLAN: r0=39(x1), r1=4(y1), r2=468(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=102(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 4
LDI r2, 468
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 102
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
