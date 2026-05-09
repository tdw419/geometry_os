; DESCRIPTION: Draws a green line from (142, 119) to (338, 3).
; PLAN: r0=142(x1), r1=119(y1), r2=338(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 119
LDI r2, 338
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
