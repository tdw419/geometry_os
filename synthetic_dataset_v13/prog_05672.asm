; DESCRIPTION: Places a white line segment connecting (426, 149) to (133, 245).
; PLAN: r0=426(x1), r1=149(y1), r2=133(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 149
LDI r2, 133
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
