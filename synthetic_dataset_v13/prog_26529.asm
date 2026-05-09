; DESCRIPTION: Renders a red line between points (396, 79) and (46, 11).
; PLAN: r0=396(x1), r1=79(y1), r2=46(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 79
LDI r2, 46
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
