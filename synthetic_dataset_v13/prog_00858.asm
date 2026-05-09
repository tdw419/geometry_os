; DESCRIPTION: Renders a orange line between points (40, 9) and (319, 73).
; PLAN: r0=40(x1), r1=9(y1), r2=319(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 9
LDI r2, 319
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
