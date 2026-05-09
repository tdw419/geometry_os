; DESCRIPTION: Places a purple line segment connecting (491, 193) to (220, 167).
; PLAN: r0=491(x1), r1=193(y1), r2=220(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 193
LDI r2, 220
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
