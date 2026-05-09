; DESCRIPTION: Places a red line segment connecting (475, 155) to (425, 81).
; PLAN: r0=475(x1), r1=155(y1), r2=425(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 155
LDI r2, 425
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
