; DESCRIPTION: Renders a purple line between points (418, 33) and (142, 127).
; PLAN: r0=418(x1), r1=33(y1), r2=142(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 33
LDI r2, 142
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
