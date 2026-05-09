; DESCRIPTION: Places a green line segment connecting (120, 194) to (438, 80).
; PLAN: r0=120(x1), r1=194(y1), r2=438(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 194
LDI r2, 438
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
