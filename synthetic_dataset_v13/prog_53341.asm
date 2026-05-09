; DESCRIPTION: Places a orange line segment connecting (219, 82) to (61, 79).
; PLAN: r0=219(x1), r1=82(y1), r2=61(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 82
LDI r2, 61
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
