; DESCRIPTION: Places a purple line segment connecting (16, 39) to (503, 66).
; PLAN: r0=16(x1), r1=39(y1), r2=503(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 39
LDI r2, 503
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
