; DESCRIPTION: Places a blue line segment connecting (10, 109) to (477, 107).
; PLAN: r0=10(x1), r1=109(y1), r2=477(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 109
LDI r2, 477
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
