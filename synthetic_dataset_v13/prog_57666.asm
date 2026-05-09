; DESCRIPTION: Places a blue line segment connecting (315, 95) to (241, 109).
; PLAN: r0=315(x1), r1=95(y1), r2=241(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 95
LDI r2, 241
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
