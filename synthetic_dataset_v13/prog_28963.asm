; DESCRIPTION: Places a purple line segment connecting (277, 210) to (432, 86).
; PLAN: r0=277(x1), r1=210(y1), r2=432(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 210
LDI r2, 432
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
