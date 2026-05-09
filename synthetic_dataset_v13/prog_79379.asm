; DESCRIPTION: Renders a orange line between points (504, 153) and (473, 233).
; PLAN: r0=504(x1), r1=153(y1), r2=473(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 153
LDI r2, 473
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
