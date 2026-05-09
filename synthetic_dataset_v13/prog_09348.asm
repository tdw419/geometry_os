; DESCRIPTION: Renders a orange line between points (70, 221) and (3, 99).
; PLAN: r0=70(x1), r1=221(y1), r2=3(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 221
LDI r2, 3
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
