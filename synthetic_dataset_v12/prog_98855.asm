; DESCRIPTION: Places a green line segment connecting (10, 94) to (438, 214).
; PLAN: r0=10(x1), r1=94(y1), r2=438(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 94
LDI r2, 438
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
