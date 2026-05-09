; DESCRIPTION: Renders a orange line between points (278, 9) and (16, 112).
; PLAN: r0=278(x1), r1=9(y1), r2=16(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 9
LDI r2, 16
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
