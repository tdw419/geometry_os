; DESCRIPTION: Places a purple line segment connecting (63, 40) to (341, 91).
; PLAN: r0=63(x1), r1=40(y1), r2=341(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 40
LDI r2, 341
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
