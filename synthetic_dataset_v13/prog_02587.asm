; DESCRIPTION: Renders a orange line between points (51, 213) and (102, 23).
; PLAN: r0=51(x1), r1=213(y1), r2=102(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 213
LDI r2, 102
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
