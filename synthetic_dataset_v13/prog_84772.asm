; DESCRIPTION: Places a purple line segment connecting (40, 214) to (293, 50).
; PLAN: r0=40(x1), r1=214(y1), r2=293(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 214
LDI r2, 293
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
