; DESCRIPTION: Places a blue line segment connecting (364, 225) to (438, 93).
; PLAN: r0=364(x1), r1=225(y1), r2=438(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 225
LDI r2, 438
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
