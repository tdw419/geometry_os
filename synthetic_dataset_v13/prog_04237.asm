; DESCRIPTION: Renders a orange line between points (510, 13) and (337, 58).
; PLAN: r0=510(x1), r1=13(y1), r2=337(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 13
LDI r2, 337
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
