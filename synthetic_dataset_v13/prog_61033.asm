; DESCRIPTION: Places a blue line segment connecting (320, 46) to (438, 254).
; PLAN: r0=320(x1), r1=46(y1), r2=438(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 46
LDI r2, 438
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
