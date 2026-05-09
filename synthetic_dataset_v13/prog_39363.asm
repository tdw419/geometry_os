; DESCRIPTION: Places a orange line segment connecting (73, 51) to (374, 55).
; PLAN: r0=73(x1), r1=51(y1), r2=374(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 51
LDI r2, 374
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
