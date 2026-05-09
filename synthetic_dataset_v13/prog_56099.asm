; DESCRIPTION: Places a white line segment connecting (24, 89) to (234, 47).
; PLAN: r0=24(x1), r1=89(y1), r2=234(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 89
LDI r2, 234
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
