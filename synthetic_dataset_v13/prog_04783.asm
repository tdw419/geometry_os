; DESCRIPTION: Renders a orange line between points (302, 6) and (206, 156).
; PLAN: r0=302(x1), r1=6(y1), r2=206(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 6
LDI r2, 206
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
