; DESCRIPTION: Renders a orange line between points (309, 99) and (508, 146).
; PLAN: r0=309(x1), r1=99(y1), r2=508(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 99
LDI r2, 508
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
