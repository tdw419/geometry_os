; DESCRIPTION: Places a blue line segment connecting (394, 229) to (49, 158).
; PLAN: r0=394(x1), r1=229(y1), r2=49(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 229
LDI r2, 49
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
