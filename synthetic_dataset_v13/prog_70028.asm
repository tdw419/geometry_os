; DESCRIPTION: Places a magenta line segment connecting (223, 90) to (490, 225).
; PLAN: r0=223(x1), r1=90(y1), r2=490(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 90
LDI r2, 490
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
