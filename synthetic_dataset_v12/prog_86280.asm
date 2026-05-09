; DESCRIPTION: Places a orange line segment connecting (115, 217) to (206, 160).
; PLAN: r0=115(x1), r1=217(y1), r2=206(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 217
LDI r2, 206
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
