; DESCRIPTION: Places a blue line segment connecting (169, 195) to (61, 13).
; PLAN: r0=169(x1), r1=195(y1), r2=61(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 195
LDI r2, 61
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
