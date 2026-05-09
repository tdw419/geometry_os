; DESCRIPTION: Places a purple line segment connecting (65, 142) to (293, 249).
; PLAN: r0=65(x1), r1=142(y1), r2=293(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 142
LDI r2, 293
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
