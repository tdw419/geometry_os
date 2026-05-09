; DESCRIPTION: Draws a magenta line from (8, 30) to (377, 218).
; PLAN: r0=8(x1), r1=30(y1), r2=377(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 30
LDI r2, 377
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
