; DESCRIPTION: Places a red line segment connecting (461, 58) to (226, 124).
; PLAN: r0=461(x1), r1=58(y1), r2=226(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 58
LDI r2, 226
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
