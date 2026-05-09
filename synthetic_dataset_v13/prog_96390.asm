; DESCRIPTION: Places a orange line segment connecting (146, 102) to (423, 37).
; PLAN: r0=146(x1), r1=102(y1), r2=423(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 102
LDI r2, 423
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
