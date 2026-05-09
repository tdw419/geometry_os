; DESCRIPTION: Places a blue line segment connecting (241, 89) to (424, 236).
; PLAN: r0=241(x1), r1=89(y1), r2=424(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 89
LDI r2, 424
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
