; DESCRIPTION: Renders a orange line between points (162, 177) and (129, 249).
; PLAN: r0=162(x1), r1=177(y1), r2=129(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 177
LDI r2, 129
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
