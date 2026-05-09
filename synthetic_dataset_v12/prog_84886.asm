; DESCRIPTION: Places a purple line segment connecting (171, 245) to (41, 204).
; PLAN: r0=171(x1), r1=245(y1), r2=41(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 245
LDI r2, 41
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
