; DESCRIPTION: Places a orange line segment connecting (408, 113) to (82, 226).
; PLAN: r0=408(x1), r1=113(y1), r2=82(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 113
LDI r2, 82
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
