; DESCRIPTION: Places a orange line segment connecting (99, 199) to (82, 59).
; PLAN: r0=99(x1), r1=199(y1), r2=82(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 199
LDI r2, 82
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
