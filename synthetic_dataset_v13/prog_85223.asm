; DESCRIPTION: Places a blue line segment connecting (79, 66) to (43, 227).
; PLAN: r0=79(x1), r1=66(y1), r2=43(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 66
LDI r2, 43
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
