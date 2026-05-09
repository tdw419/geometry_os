; DESCRIPTION: Renders a black line between points (114, 2) and (68, 124).
; PLAN: r0=114(x1), r1=2(y1), r2=68(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 2
LDI r2, 68
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
