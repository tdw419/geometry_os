; DESCRIPTION: Renders a orange line between points (359, 25) and (49, 192).
; PLAN: r0=359(x1), r1=25(y1), r2=49(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 25
LDI r2, 49
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
