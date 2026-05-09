; DESCRIPTION: Places a purple line segment connecting (312, 238) to (212, 213).
; PLAN: r0=312(x1), r1=238(y1), r2=212(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 238
LDI r2, 212
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
