; DESCRIPTION: Renders a orange line between points (52, 15) and (166, 196).
; PLAN: r0=52(x1), r1=15(y1), r2=166(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 15
LDI r2, 166
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
