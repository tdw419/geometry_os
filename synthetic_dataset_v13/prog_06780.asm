; DESCRIPTION: Renders a orange line between points (510, 19) and (411, 118).
; PLAN: r0=510(x1), r1=19(y1), r2=411(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 19
LDI r2, 411
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
