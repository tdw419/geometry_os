; DESCRIPTION: Draws a green line from (419, 24) to (246, 145).
; PLAN: r0=419(x1), r1=24(y1), r2=246(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 24
LDI r2, 246
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
