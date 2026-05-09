; DESCRIPTION: Renders a orange line between points (75, 222) and (52, 56).
; PLAN: r0=75(x1), r1=222(y1), r2=52(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 222
LDI r2, 52
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
