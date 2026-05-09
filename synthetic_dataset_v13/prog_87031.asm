; DESCRIPTION: Places a orange line segment connecting (82, 52) to (504, 86).
; PLAN: r0=82(x1), r1=52(y1), r2=504(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 52
LDI r2, 504
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
