; DESCRIPTION: Places a red line segment connecting (270, 225) to (334, 37).
; PLAN: r0=270(x1), r1=225(y1), r2=334(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 225
LDI r2, 334
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
