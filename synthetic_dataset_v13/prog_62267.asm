; DESCRIPTION: Places a blue line segment connecting (6, 151) to (13, 66).
; PLAN: r0=6(x1), r1=151(y1), r2=13(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 151
LDI r2, 13
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
