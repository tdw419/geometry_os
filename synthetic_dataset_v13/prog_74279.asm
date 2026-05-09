; DESCRIPTION: Places a orange line segment connecting (207, 250) to (345, 176).
; PLAN: r0=207(x1), r1=250(y1), r2=345(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 250
LDI r2, 345
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
