; DESCRIPTION: Places a purple line segment connecting (187, 122) to (503, 73).
; PLAN: r0=187(x1), r1=122(y1), r2=503(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 122
LDI r2, 503
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
