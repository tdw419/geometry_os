; DESCRIPTION: Places a orange line segment connecting (103, 194) to (196, 31).
; PLAN: r0=103(x1), r1=194(y1), r2=196(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 194
LDI r2, 196
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
