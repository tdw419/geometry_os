; DESCRIPTION: Places a purple line segment connecting (464, 46) to (351, 76).
; PLAN: r0=464(x1), r1=46(y1), r2=351(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 46
LDI r2, 351
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
