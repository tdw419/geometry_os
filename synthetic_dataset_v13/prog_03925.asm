; DESCRIPTION: Renders a orange line between points (486, 5) and (77, 52).
; PLAN: r0=486(x1), r1=5(y1), r2=77(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 5
LDI r2, 77
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
