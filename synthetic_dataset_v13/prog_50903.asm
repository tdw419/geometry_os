; DESCRIPTION: Places a orange line segment connecting (504, 82) to (20, 86).
; PLAN: r0=504(x1), r1=82(y1), r2=20(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 82
LDI r2, 20
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
