; DESCRIPTION: Places a purple line segment connecting (362, 70) to (262, 191).
; PLAN: r0=362(x1), r1=70(y1), r2=262(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 70
LDI r2, 262
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
