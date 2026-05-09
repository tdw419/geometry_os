; DESCRIPTION: Places a red line segment connecting (258, 21) to (61, 47).
; PLAN: r0=258(x1), r1=21(y1), r2=61(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 21
LDI r2, 61
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
