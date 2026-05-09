; DESCRIPTION: Places a yellow line segment connecting (490, 65) to (300, 66).
; PLAN: r0=490(x1), r1=65(y1), r2=300(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 65
LDI r2, 300
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
