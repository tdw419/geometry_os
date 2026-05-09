; DESCRIPTION: Renders a orange line between points (116, 84) and (61, 196).
; PLAN: r0=116(x1), r1=84(y1), r2=61(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 84
LDI r2, 61
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
