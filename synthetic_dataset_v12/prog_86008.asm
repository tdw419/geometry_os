; DESCRIPTION: Places a red line segment connecting (170, 117) to (193, 90).
; PLAN: r0=170(x1), r1=117(y1), r2=193(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 117
LDI r2, 193
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
