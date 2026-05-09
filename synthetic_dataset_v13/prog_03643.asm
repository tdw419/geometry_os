; DESCRIPTION: Places a yellow line segment connecting (471, 176) to (359, 31).
; PLAN: r0=471(x1), r1=176(y1), r2=359(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 176
LDI r2, 359
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
