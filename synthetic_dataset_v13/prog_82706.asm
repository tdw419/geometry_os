; DESCRIPTION: Places a yellow line segment connecting (434, 145) to (454, 158).
; PLAN: r0=434(x1), r1=145(y1), r2=454(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 145
LDI r2, 454
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
