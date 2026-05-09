; DESCRIPTION: Places a purple line segment connecting (210, 220) to (182, 252).
; PLAN: r0=210(x1), r1=220(y1), r2=182(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 220
LDI r2, 182
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
