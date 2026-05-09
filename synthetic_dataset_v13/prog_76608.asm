; DESCRIPTION: Places a green line segment connecting (226, 159) to (438, 55).
; PLAN: r0=226(x1), r1=159(y1), r2=438(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 159
LDI r2, 438
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
