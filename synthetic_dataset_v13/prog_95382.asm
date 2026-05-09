; DESCRIPTION: Draws a magenta line from (510, 177) to (89, 218).
; PLAN: r0=510(x1), r1=177(y1), r2=89(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 177
LDI r2, 89
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
