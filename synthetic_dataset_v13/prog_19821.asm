; DESCRIPTION: Renders a orange line between points (408, 238) and (466, 160).
; PLAN: r0=408(x1), r1=238(y1), r2=466(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 238
LDI r2, 466
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
