; DESCRIPTION: Renders a orange line between points (300, 253) and (302, 229).
; PLAN: r0=300(x1), r1=253(y1), r2=302(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 253
LDI r2, 302
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
