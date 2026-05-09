; DESCRIPTION: Places a orange line segment connecting (440, 13) to (109, 59).
; PLAN: r0=440(x1), r1=13(y1), r2=109(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 13
LDI r2, 109
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
