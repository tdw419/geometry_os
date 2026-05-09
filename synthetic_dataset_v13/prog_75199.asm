; DESCRIPTION: Places a purple line segment connecting (223, 67) to (461, 16).
; PLAN: r0=223(x1), r1=67(y1), r2=461(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 67
LDI r2, 461
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
