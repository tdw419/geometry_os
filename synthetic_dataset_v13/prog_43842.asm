; DESCRIPTION: Renders a orange line between points (195, 244) and (17, 72).
; PLAN: r0=195(x1), r1=244(y1), r2=17(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 244
LDI r2, 17
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
