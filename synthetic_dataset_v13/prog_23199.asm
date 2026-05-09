; DESCRIPTION: Places a magenta line segment connecting (162, 44) to (164, 218).
; PLAN: r0=162(x1), r1=44(y1), r2=164(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 44
LDI r2, 164
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
