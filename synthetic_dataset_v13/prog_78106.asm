; DESCRIPTION: Places a blue line segment connecting (12, 19) to (337, 170).
; PLAN: r0=12(x1), r1=19(y1), r2=337(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 19
LDI r2, 337
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
