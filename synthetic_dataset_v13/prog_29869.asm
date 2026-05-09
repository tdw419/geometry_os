; DESCRIPTION: Places a cyan line segment connecting (389, 232) to (331, 136).
; PLAN: r0=389(x1), r1=232(y1), r2=331(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 232
LDI r2, 331
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
