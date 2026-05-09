; DESCRIPTION: Places a magenta line segment connecting (94, 77) to (477, 177).
; PLAN: r0=94(x1), r1=77(y1), r2=477(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 77
LDI r2, 477
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
