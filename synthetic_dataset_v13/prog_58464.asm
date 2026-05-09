; DESCRIPTION: Places a red line segment connecting (98, 174) to (356, 74).
; PLAN: r0=98(x1), r1=174(y1), r2=356(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 174
LDI r2, 356
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
