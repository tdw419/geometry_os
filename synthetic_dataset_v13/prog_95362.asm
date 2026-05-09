; DESCRIPTION: Draws a magenta line from (139, 131) to (85, 137).
; PLAN: r0=139(x1), r1=131(y1), r2=85(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 131
LDI r2, 85
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
