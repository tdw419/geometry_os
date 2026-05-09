; DESCRIPTION: Places a white line segment connecting (272, 133) to (155, 33).
; PLAN: r0=272(x1), r1=133(y1), r2=155(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 133
LDI r2, 155
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
