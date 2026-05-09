; DESCRIPTION: Places a red line segment connecting (91, 1) to (73, 229).
; PLAN: r0=91(x1), r1=1(y1), r2=73(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 1
LDI r2, 73
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
