; DESCRIPTION: Places a purple line segment connecting (393, 132) to (71, 0).
; PLAN: r0=393(x1), r1=132(y1), r2=71(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 132
LDI r2, 71
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
