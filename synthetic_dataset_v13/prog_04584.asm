; DESCRIPTION: Places a yellow line segment connecting (97, 81) to (423, 249).
; PLAN: r0=97(x1), r1=81(y1), r2=423(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 81
LDI r2, 423
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
