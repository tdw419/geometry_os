; DESCRIPTION: Places a purple line segment connecting (38, 108) to (251, 246).
; PLAN: r0=38(x1), r1=108(y1), r2=251(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 108
LDI r2, 251
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
