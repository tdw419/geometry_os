; DESCRIPTION: Places a orange line segment connecting (131, 120) to (143, 5).
; PLAN: r0=131(x1), r1=120(y1), r2=143(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 120
LDI r2, 143
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
