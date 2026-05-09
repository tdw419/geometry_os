; DESCRIPTION: Composite: Renders a purple disk with center (237, 87) and radius 64 then Draws a purple line from (478, 3) to (392, 34).
; PLAN: r0=237(x), r1=87(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=3(y1), r7=392(x2), r8=34(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 87
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 3
LDI r7, 392
LDI r8, 34
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
