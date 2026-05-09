; DESCRIPTION: Places a red line segment connecting (193, 164) to (89, 186).
; PLAN: r0=193(x1), r1=164(y1), r2=89(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 164
LDI r2, 89
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
