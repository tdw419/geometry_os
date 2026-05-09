; DESCRIPTION: Renders a orange line between points (97, 116) and (462, 177).
; PLAN: r0=97(x1), r1=116(y1), r2=462(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 116
LDI r2, 462
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
