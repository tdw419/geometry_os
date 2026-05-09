; DESCRIPTION: Places a orange line segment connecting (4, 49) to (82, 46).
; PLAN: r0=4(x1), r1=49(y1), r2=82(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 49
LDI r2, 82
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
