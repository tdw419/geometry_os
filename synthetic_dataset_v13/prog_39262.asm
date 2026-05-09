; DESCRIPTION: Draws a green line from (155, 2) to (342, 218).
; PLAN: r0=155(x1), r1=2(y1), r2=342(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 2
LDI r2, 342
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
