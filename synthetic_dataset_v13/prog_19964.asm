; DESCRIPTION: Places a orange line segment connecting (33, 162) to (223, 197).
; PLAN: r0=33(x1), r1=162(y1), r2=223(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 162
LDI r2, 223
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
