; DESCRIPTION: Places a orange line segment connecting (79, 241) to (481, 73).
; PLAN: r0=79(x1), r1=241(y1), r2=481(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 241
LDI r2, 481
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
