; DESCRIPTION: Places a purple line segment connecting (423, 140) to (471, 113).
; PLAN: r0=423(x1), r1=140(y1), r2=471(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 140
LDI r2, 471
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
