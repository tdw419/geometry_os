; DESCRIPTION: Places a orange line segment connecting (27, 212) to (36, 208).
; PLAN: r0=27(x1), r1=212(y1), r2=36(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 212
LDI r2, 36
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
