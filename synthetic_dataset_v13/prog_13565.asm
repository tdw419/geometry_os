; DESCRIPTION: Renders a orange line between points (411, 165) and (132, 30).
; PLAN: r0=411(x1), r1=165(y1), r2=132(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 165
LDI r2, 132
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
