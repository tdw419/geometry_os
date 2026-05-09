; DESCRIPTION: Places a magenta line segment connecting (431, 18) to (342, 73).
; PLAN: r0=431(x1), r1=18(y1), r2=342(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 18
LDI r2, 342
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
