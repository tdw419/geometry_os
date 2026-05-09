; DESCRIPTION: Renders a orange line between points (206, 87) and (44, 131).
; PLAN: r0=206(x1), r1=87(y1), r2=44(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 87
LDI r2, 44
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
