; DESCRIPTION: Places a orange line segment connecting (361, 29) to (38, 132).
; PLAN: r0=361(x1), r1=29(y1), r2=38(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 29
LDI r2, 38
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
