; DESCRIPTION: Places a orange line segment connecting (161, 149) to (368, 204).
; PLAN: r0=161(x1), r1=149(y1), r2=368(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 149
LDI r2, 368
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
