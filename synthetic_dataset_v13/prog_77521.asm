; DESCRIPTION: Places a purple line segment connecting (71, 63) to (368, 100).
; PLAN: r0=71(x1), r1=63(y1), r2=368(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 63
LDI r2, 368
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
