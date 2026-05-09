; DESCRIPTION: Places a red line segment connecting (432, 109) to (39, 225).
; PLAN: r0=432(x1), r1=109(y1), r2=39(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 109
LDI r2, 39
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
