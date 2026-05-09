; DESCRIPTION: Renders a orange line between points (17, 0) and (13, 94).
; PLAN: r0=17(x1), r1=0(y1), r2=13(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 0
LDI r2, 13
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
