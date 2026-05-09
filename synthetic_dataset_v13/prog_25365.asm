; DESCRIPTION: Places a purple line segment connecting (149, 174) to (397, 83).
; PLAN: r0=149(x1), r1=174(y1), r2=397(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 174
LDI r2, 397
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
