; DESCRIPTION: Places a orange line segment connecting (93, 113) to (82, 219).
; PLAN: r0=93(x1), r1=113(y1), r2=82(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 113
LDI r2, 82
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
