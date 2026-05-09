; DESCRIPTION: Renders a orange line between points (300, 47) and (24, 249).
; PLAN: r0=300(x1), r1=47(y1), r2=24(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 47
LDI r2, 24
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
