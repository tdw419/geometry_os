; DESCRIPTION: Places a orange line segment connecting (408, 105) to (502, 191).
; PLAN: r0=408(x1), r1=105(y1), r2=502(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 105
LDI r2, 502
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
