; DESCRIPTION: Places a magenta line segment connecting (108, 84) to (177, 110).
; PLAN: r0=108(x1), r1=84(y1), r2=177(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 84
LDI r2, 177
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
