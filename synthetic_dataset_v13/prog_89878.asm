; DESCRIPTION: Draws a magenta line from (308, 62) to (176, 100).
; PLAN: r0=308(x1), r1=62(y1), r2=176(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 62
LDI r2, 176
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
