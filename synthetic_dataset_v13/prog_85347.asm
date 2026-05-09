; DESCRIPTION: Draws a magenta line from (68, 131) to (351, 30).
; PLAN: r0=68(x1), r1=131(y1), r2=351(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 131
LDI r2, 351
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
