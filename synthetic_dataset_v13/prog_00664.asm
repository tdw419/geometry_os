; DESCRIPTION: Places a purple line segment connecting (439, 165) to (486, 197).
; PLAN: r0=439(x1), r1=165(y1), r2=486(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 165
LDI r2, 486
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
