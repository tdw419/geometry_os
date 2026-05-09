; DESCRIPTION: Draws a green line from (471, 75) to (61, 136).
; PLAN: r0=471(x1), r1=75(y1), r2=61(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 75
LDI r2, 61
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
