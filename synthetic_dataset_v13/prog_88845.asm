; DESCRIPTION: Renders a black line between points (278, 226) and (68, 112).
; PLAN: r0=278(x1), r1=226(y1), r2=68(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 226
LDI r2, 68
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
