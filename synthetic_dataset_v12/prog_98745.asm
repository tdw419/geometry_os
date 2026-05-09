; DESCRIPTION: Renders a orange line between points (226, 68) and (14, 196).
; PLAN: r0=226(x1), r1=68(y1), r2=14(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 68
LDI r2, 14
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
