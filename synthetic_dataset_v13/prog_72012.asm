; DESCRIPTION: Renders a orange line between points (51, 207) and (258, 144).
; PLAN: r0=51(x1), r1=207(y1), r2=258(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 207
LDI r2, 258
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
