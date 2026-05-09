; DESCRIPTION: Composite: Creates a white circular shape at (486, 93) with radius 12 then Draws a purple line from (45, 94) to (216, 220).
; PLAN: r0=486(x), r1=93(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x1), r6=94(y1), r7=216(x2), r8=220(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 93
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 94
LDI r7, 216
LDI r8, 220
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
