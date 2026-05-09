; DESCRIPTION: Draws a green line from (200, 56) to (358, 61).
; PLAN: r0=200(x1), r1=56(y1), r2=358(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 56
LDI r2, 358
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
