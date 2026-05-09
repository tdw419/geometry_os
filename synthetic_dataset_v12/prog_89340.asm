; DESCRIPTION: Places a red line segment connecting (10, 61) to (186, 206).
; PLAN: r0=10(x1), r1=61(y1), r2=186(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 61
LDI r2, 186
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
