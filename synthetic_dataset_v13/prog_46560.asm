; DESCRIPTION: Draws a green line from (308, 156) to (349, 106).
; PLAN: r0=308(x1), r1=156(y1), r2=349(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 156
LDI r2, 349
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
