; DESCRIPTION: Places a white line segment connecting (332, 234) to (161, 133).
; PLAN: r0=332(x1), r1=234(y1), r2=161(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 234
LDI r2, 161
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
