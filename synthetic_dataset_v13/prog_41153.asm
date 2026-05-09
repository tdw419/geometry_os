; DESCRIPTION: Renders a orange line between points (411, 46) and (253, 108).
; PLAN: r0=411(x1), r1=46(y1), r2=253(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 46
LDI r2, 253
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
