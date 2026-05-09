; DESCRIPTION: Draws a blue line from (308, 150) to (311, 204).
; PLAN: r0=308(x1), r1=150(y1), r2=311(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 150
LDI r2, 311
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
