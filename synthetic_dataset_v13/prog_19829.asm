; DESCRIPTION: Places a red line segment connecting (125, 241) to (280, 233).
; PLAN: r0=125(x1), r1=241(y1), r2=280(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 241
LDI r2, 280
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
