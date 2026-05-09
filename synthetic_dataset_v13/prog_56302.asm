; DESCRIPTION: Draws a magenta line from (110, 246) to (308, 149).
; PLAN: r0=110(x1), r1=246(y1), r2=308(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 246
LDI r2, 308
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
