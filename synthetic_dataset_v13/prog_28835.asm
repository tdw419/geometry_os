; DESCRIPTION: Places a purple line segment connecting (140, 168) to (74, 37).
; PLAN: r0=140(x1), r1=168(y1), r2=74(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 168
LDI r2, 74
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
