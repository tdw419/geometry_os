; DESCRIPTION: Places a magenta line segment connecting (413, 44) to (0, 121).
; PLAN: r0=413(x1), r1=44(y1), r2=0(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 44
LDI r2, 0
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
