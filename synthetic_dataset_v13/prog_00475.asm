; DESCRIPTION: Renders a orange line between points (23, 40) and (504, 233).
; PLAN: r0=23(x1), r1=40(y1), r2=504(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 40
LDI r2, 504
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
