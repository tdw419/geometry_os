; DESCRIPTION: Places a red line segment connecting (234, 245) to (133, 51).
; PLAN: r0=234(x1), r1=245(y1), r2=133(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 245
LDI r2, 133
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
