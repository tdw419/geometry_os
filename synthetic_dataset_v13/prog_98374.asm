; DESCRIPTION: Renders a orange line between points (437, 8) and (71, 189).
; PLAN: r0=437(x1), r1=8(y1), r2=71(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 8
LDI r2, 71
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
