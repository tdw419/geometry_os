; DESCRIPTION: Places a green line segment connecting (438, 164) to (172, 158).
; PLAN: r0=438(x1), r1=164(y1), r2=172(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 164
LDI r2, 172
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
