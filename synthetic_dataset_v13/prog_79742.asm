; DESCRIPTION: Renders a red line between points (254, 211) and (26, 79).
; PLAN: r0=254(x1), r1=211(y1), r2=26(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 211
LDI r2, 26
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
