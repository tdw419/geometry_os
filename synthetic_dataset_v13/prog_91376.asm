; DESCRIPTION: Places a orange line segment connecting (466, 112) to (362, 66).
; PLAN: r0=466(x1), r1=112(y1), r2=362(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 112
LDI r2, 362
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
