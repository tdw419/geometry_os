; DESCRIPTION: Places a orange line segment connecting (134, 214) to (176, 221).
; PLAN: r0=134(x1), r1=214(y1), r2=176(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 214
LDI r2, 176
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
