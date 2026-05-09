; DESCRIPTION: Places a magenta line segment connecting (431, 33) to (200, 91).
; PLAN: r0=431(x1), r1=33(y1), r2=200(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 33
LDI r2, 200
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
