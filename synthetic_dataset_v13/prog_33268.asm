; DESCRIPTION: Places a purple line segment connecting (452, 67) to (510, 71).
; PLAN: r0=452(x1), r1=67(y1), r2=510(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 67
LDI r2, 510
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
