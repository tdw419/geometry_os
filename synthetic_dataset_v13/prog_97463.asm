; DESCRIPTION: Places a white line segment connecting (426, 214) to (84, 216).
; PLAN: r0=426(x1), r1=214(y1), r2=84(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 214
LDI r2, 84
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
