; DESCRIPTION: Places a white line segment connecting (426, 229) to (438, 110).
; PLAN: r0=426(x1), r1=229(y1), r2=438(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 229
LDI r2, 438
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
