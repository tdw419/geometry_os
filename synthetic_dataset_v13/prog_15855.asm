; DESCRIPTION: Renders a orange line between points (69, 160) and (47, 25).
; PLAN: r0=69(x1), r1=160(y1), r2=47(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 160
LDI r2, 47
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
