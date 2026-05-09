; DESCRIPTION: Places a blue line segment connecting (74, 66) to (8, 129).
; PLAN: r0=74(x1), r1=66(y1), r2=8(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 66
LDI r2, 8
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
