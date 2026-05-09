; DESCRIPTION: Places a purple line segment connecting (486, 134) to (79, 0).
; PLAN: r0=486(x1), r1=134(y1), r2=79(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 134
LDI r2, 79
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
