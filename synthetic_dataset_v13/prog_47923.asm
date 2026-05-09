; DESCRIPTION: Places a cyan line segment connecting (419, 232) to (251, 58).
; PLAN: r0=419(x1), r1=232(y1), r2=251(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 232
LDI r2, 251
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
