; DESCRIPTION: Renders a orange line between points (258, 73) and (55, 1).
; PLAN: r0=258(x1), r1=73(y1), r2=55(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 73
LDI r2, 55
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
