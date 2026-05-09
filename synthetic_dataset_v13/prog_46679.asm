; DESCRIPTION: Places a red line segment connecting (509, 44) to (252, 105).
; PLAN: r0=509(x1), r1=44(y1), r2=252(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 44
LDI r2, 252
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
