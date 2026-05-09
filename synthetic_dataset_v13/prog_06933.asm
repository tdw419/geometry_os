; DESCRIPTION: Places a purple line segment connecting (332, 120) to (491, 71).
; PLAN: r0=332(x1), r1=120(y1), r2=491(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 120
LDI r2, 491
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
