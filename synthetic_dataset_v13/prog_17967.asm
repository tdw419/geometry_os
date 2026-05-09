; DESCRIPTION: Places a white line segment connecting (323, 12) to (106, 229).
; PLAN: r0=323(x1), r1=12(y1), r2=106(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 12
LDI r2, 106
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
