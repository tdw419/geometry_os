; DESCRIPTION: Renders a orange line between points (150, 110) and (364, 87).
; PLAN: r0=150(x1), r1=110(y1), r2=364(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 110
LDI r2, 364
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
