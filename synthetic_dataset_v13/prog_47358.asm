; DESCRIPTION: Renders a orange line between points (277, 211) and (508, 72).
; PLAN: r0=277(x1), r1=211(y1), r2=508(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 211
LDI r2, 508
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
