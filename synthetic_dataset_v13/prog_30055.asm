; DESCRIPTION: Places a blue line segment connecting (439, 67) to (461, 19).
; PLAN: r0=439(x1), r1=67(y1), r2=461(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 67
LDI r2, 461
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
