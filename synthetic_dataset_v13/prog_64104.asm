; DESCRIPTION: Renders a orange line between points (456, 142) and (105, 169).
; PLAN: r0=456(x1), r1=142(y1), r2=105(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 142
LDI r2, 105
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
