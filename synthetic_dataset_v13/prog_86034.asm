; DESCRIPTION: Places a purple line segment connecting (197, 28) to (172, 41).
; PLAN: r0=197(x1), r1=28(y1), r2=172(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 28
LDI r2, 172
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
