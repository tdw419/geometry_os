; DESCRIPTION: Places a purple line segment connecting (376, 116) to (160, 41).
; PLAN: r0=376(x1), r1=116(y1), r2=160(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 116
LDI r2, 160
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
