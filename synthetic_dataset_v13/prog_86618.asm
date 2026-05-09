; DESCRIPTION: Renders a orange line between points (172, 194) and (186, 56).
; PLAN: r0=172(x1), r1=194(y1), r2=186(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 194
LDI r2, 186
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
