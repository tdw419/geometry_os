; DESCRIPTION: Renders a orange line between points (322, 207) and (161, 8).
; PLAN: r0=322(x1), r1=207(y1), r2=161(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 207
LDI r2, 161
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
