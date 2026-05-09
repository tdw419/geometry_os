; DESCRIPTION: Places a blue line segment connecting (339, 66) to (263, 208).
; PLAN: r0=339(x1), r1=66(y1), r2=263(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 66
LDI r2, 263
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
