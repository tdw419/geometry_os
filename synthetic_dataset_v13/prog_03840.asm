; DESCRIPTION: Renders a orange line between points (197, 174) and (35, 20).
; PLAN: r0=197(x1), r1=174(y1), r2=35(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 174
LDI r2, 35
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
