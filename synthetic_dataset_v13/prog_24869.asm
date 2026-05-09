; DESCRIPTION: Places a green line segment connecting (133, 168) to (11, 234).
; PLAN: r0=133(x1), r1=168(y1), r2=11(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 168
LDI r2, 11
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
