; DESCRIPTION: Renders a orange line between points (364, 156) and (124, 196).
; PLAN: r0=364(x1), r1=156(y1), r2=124(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 156
LDI r2, 124
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
