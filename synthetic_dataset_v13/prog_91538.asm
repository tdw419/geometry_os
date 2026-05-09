; DESCRIPTION: Renders a orange line between points (317, 5) and (142, 80).
; PLAN: r0=317(x1), r1=5(y1), r2=142(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 5
LDI r2, 142
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
