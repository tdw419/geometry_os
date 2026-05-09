; DESCRIPTION: Places a red line segment connecting (381, 88) to (349, 87).
; PLAN: r0=381(x1), r1=88(y1), r2=349(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 88
LDI r2, 349
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
