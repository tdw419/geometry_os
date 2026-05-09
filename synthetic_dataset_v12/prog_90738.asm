; DESCRIPTION: Places a purple line segment connecting (228, 109) to (41, 58).
; PLAN: r0=228(x1), r1=109(y1), r2=41(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 109
LDI r2, 41
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
