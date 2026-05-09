; DESCRIPTION: Places a red line segment connecting (159, 198) to (185, 84).
; PLAN: r0=159(x1), r1=198(y1), r2=185(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 198
LDI r2, 185
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
