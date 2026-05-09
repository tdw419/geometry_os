; DESCRIPTION: Places a yellow line segment connecting (98, 87) to (163, 180).
; PLAN: r0=98(x1), r1=87(y1), r2=163(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 87
LDI r2, 163
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
