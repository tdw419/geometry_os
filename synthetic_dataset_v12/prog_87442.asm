; DESCRIPTION: Places a magenta line segment connecting (180, 157) to (266, 1).
; PLAN: r0=180(x1), r1=157(y1), r2=266(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 157
LDI r2, 266
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
