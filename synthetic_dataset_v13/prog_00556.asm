; DESCRIPTION: Places a purple line segment connecting (28, 102) to (39, 91).
; PLAN: r0=28(x1), r1=102(y1), r2=39(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 102
LDI r2, 39
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
