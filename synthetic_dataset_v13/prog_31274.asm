; DESCRIPTION: Places a orange line segment connecting (131, 74) to (1, 86).
; PLAN: r0=131(x1), r1=74(y1), r2=1(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 74
LDI r2, 1
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
