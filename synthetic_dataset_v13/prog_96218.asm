; DESCRIPTION: Draws a magenta line from (470, 131) to (24, 212).
; PLAN: r0=470(x1), r1=131(y1), r2=24(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 131
LDI r2, 24
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
