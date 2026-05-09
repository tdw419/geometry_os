; DESCRIPTION: Renders a black line between points (79, 139) and (290, 181).
; PLAN: r0=79(x1), r1=139(y1), r2=290(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 139
LDI r2, 290
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
