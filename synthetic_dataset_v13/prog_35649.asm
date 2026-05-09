; DESCRIPTION: Draws a magenta line from (29, 254) to (300, 131).
; PLAN: r0=29(x1), r1=254(y1), r2=300(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 254
LDI r2, 300
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
