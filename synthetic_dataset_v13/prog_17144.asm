; DESCRIPTION: Places a purple line segment connecting (472, 75) to (33, 210).
; PLAN: r0=472(x1), r1=75(y1), r2=33(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 75
LDI r2, 33
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
