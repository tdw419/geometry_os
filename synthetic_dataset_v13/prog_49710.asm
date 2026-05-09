; DESCRIPTION: Places a blue line segment connecting (253, 44) to (273, 118).
; PLAN: r0=253(x1), r1=44(y1), r2=273(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 44
LDI r2, 273
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
