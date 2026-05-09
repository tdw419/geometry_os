; DESCRIPTION: Draws a green line from (308, 74) to (407, 119).
; PLAN: r0=308(x1), r1=74(y1), r2=407(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 74
LDI r2, 407
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
