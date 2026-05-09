; DESCRIPTION: Renders a orange line between points (333, 26) and (95, 149).
; PLAN: r0=333(x1), r1=26(y1), r2=95(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 26
LDI r2, 95
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
