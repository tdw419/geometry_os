; DESCRIPTION: Renders a orange line between points (322, 60) and (393, 85).
; PLAN: r0=322(x1), r1=60(y1), r2=393(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 60
LDI r2, 393
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
