; DESCRIPTION: Places a purple line segment connecting (137, 180) to (6, 210).
; PLAN: r0=137(x1), r1=180(y1), r2=6(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 180
LDI r2, 6
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
