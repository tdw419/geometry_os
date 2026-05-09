; DESCRIPTION: Renders a orange line between points (433, 131) and (223, 77).
; PLAN: r0=433(x1), r1=131(y1), r2=223(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 131
LDI r2, 223
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
