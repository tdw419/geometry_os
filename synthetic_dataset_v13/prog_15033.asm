; DESCRIPTION: Places a magenta line segment connecting (13, 90) to (266, 223).
; PLAN: r0=13(x1), r1=90(y1), r2=266(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 90
LDI r2, 266
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
