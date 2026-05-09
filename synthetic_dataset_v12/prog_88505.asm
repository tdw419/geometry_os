; DESCRIPTION: Places a purple line segment connecting (372, 117) to (293, 122).
; PLAN: r0=372(x1), r1=117(y1), r2=293(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 117
LDI r2, 293
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
