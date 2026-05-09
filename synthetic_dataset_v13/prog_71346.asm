; DESCRIPTION: Places a red line segment connecting (270, 219) to (453, 238).
; PLAN: r0=270(x1), r1=219(y1), r2=453(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 219
LDI r2, 453
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
