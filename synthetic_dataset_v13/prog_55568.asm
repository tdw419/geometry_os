; DESCRIPTION: Renders a purple line between points (418, 34) and (174, 105).
; PLAN: r0=418(x1), r1=34(y1), r2=174(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 34
LDI r2, 174
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
