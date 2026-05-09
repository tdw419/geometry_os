; DESCRIPTION: Places a purple line segment connecting (150, 53) to (153, 41).
; PLAN: r0=150(x1), r1=53(y1), r2=153(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 53
LDI r2, 153
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
