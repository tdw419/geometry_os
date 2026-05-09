; DESCRIPTION: Places a blue line segment connecting (31, 23) to (177, 25).
; PLAN: r0=31(x1), r1=23(y1), r2=177(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 23
LDI r2, 177
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
