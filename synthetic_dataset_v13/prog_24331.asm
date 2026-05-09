; DESCRIPTION: Renders a black line between points (226, 174) and (49, 209).
; PLAN: r0=226(x1), r1=174(y1), r2=49(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 174
LDI r2, 49
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
