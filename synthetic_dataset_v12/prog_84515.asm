; DESCRIPTION: Places a blue line segment connecting (151, 161) to (420, 153).
; PLAN: r0=151(x1), r1=161(y1), r2=420(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 161
LDI r2, 420
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
