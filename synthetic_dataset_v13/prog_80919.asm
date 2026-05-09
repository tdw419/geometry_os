; DESCRIPTION: Renders a orange line between points (306, 110) and (487, 10).
; PLAN: r0=306(x1), r1=110(y1), r2=487(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 110
LDI r2, 487
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
