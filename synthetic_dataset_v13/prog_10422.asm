; DESCRIPTION: Places a green line segment connecting (232, 95) to (389, 59).
; PLAN: r0=232(x1), r1=95(y1), r2=389(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 95
LDI r2, 389
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
