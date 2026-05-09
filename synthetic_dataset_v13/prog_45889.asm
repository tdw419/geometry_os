; DESCRIPTION: Renders a orange line between points (5, 11) and (291, 17).
; PLAN: r0=5(x1), r1=11(y1), r2=291(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 11
LDI r2, 291
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
