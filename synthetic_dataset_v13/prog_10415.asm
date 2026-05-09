; DESCRIPTION: Places a blue line segment connecting (241, 26) to (249, 114).
; PLAN: r0=241(x1), r1=26(y1), r2=249(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 26
LDI r2, 249
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
