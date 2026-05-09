; DESCRIPTION: Composite: Renders a red disk with center (201, 118) and radius 73 then Draws a purple line from (224, 53) to (458, 87).
; PLAN: r0=201(x), r1=118(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x1), r6=53(y1), r7=458(x2), r8=87(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 118
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 53
LDI r7, 458
LDI r8, 87
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
