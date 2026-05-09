; DESCRIPTION: Renders a black line between points (101, 146) and (134, 124).
; PLAN: r0=101(x1), r1=146(y1), r2=134(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 146
LDI r2, 134
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
