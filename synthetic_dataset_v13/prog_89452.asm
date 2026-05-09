; DESCRIPTION: Places a purple line segment connecting (426, 229) to (428, 103).
; PLAN: r0=426(x1), r1=229(y1), r2=428(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 229
LDI r2, 428
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
