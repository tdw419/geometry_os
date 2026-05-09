; DESCRIPTION: Renders a orange line between points (102, 8) and (225, 2).
; PLAN: r0=102(x1), r1=8(y1), r2=225(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 8
LDI r2, 225
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
