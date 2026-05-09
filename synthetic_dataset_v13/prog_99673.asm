; DESCRIPTION: Renders a orange line between points (131, 186) and (40, 233).
; PLAN: r0=131(x1), r1=186(y1), r2=40(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 186
LDI r2, 40
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
