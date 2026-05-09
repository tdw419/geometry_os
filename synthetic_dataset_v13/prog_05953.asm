; DESCRIPTION: Places a red line segment connecting (419, 108) to (261, 66).
; PLAN: r0=419(x1), r1=108(y1), r2=261(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 108
LDI r2, 261
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
