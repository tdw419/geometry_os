; DESCRIPTION: Draws a magenta line from (131, 206) to (212, 20).
; PLAN: r0=131(x1), r1=206(y1), r2=212(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 206
LDI r2, 212
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
