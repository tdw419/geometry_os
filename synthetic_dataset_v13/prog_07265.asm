; DESCRIPTION: Places a orange line segment connecting (51, 254) to (46, 165).
; PLAN: r0=51(x1), r1=254(y1), r2=46(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 254
LDI r2, 46
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
