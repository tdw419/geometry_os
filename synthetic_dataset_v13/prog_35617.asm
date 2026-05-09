; DESCRIPTION: Places a purple line segment connecting (243, 40) to (134, 194).
; PLAN: r0=243(x1), r1=40(y1), r2=134(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 40
LDI r2, 134
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
