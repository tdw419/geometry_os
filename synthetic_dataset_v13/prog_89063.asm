; DESCRIPTION: Renders a orange line between points (146, 22) and (51, 165).
; PLAN: r0=146(x1), r1=22(y1), r2=51(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 22
LDI r2, 51
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
