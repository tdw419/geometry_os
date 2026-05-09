; DESCRIPTION: Renders a black line between points (44, 138) and (183, 65).
; PLAN: r0=44(x1), r1=138(y1), r2=183(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 138
LDI r2, 183
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
