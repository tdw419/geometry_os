; DESCRIPTION: Renders a orange line between points (123, 132) and (51, 176).
; PLAN: r0=123(x1), r1=132(y1), r2=51(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 132
LDI r2, 51
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
