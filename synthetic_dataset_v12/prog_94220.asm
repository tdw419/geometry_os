; DESCRIPTION: Places a red line segment connecting (248, 52) to (61, 208).
; PLAN: r0=248(x1), r1=52(y1), r2=61(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 52
LDI r2, 61
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
