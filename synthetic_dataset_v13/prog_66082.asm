; DESCRIPTION: Places a red line segment connecting (182, 149) to (377, 137).
; PLAN: r0=182(x1), r1=149(y1), r2=377(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 149
LDI r2, 377
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
