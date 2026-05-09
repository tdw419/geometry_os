; DESCRIPTION: Places a red line segment connecting (75, 247) to (117, 74).
; PLAN: r0=75(x1), r1=247(y1), r2=117(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 247
LDI r2, 117
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
