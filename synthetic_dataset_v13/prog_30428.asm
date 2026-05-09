; DESCRIPTION: Places a purple line segment connecting (200, 213) to (70, 41).
; PLAN: r0=200(x1), r1=213(y1), r2=70(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 213
LDI r2, 70
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
