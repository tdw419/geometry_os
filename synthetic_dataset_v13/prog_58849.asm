; DESCRIPTION: Renders a orange line between points (7, 218) and (38, 138).
; PLAN: r0=7(x1), r1=218(y1), r2=38(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 218
LDI r2, 38
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
