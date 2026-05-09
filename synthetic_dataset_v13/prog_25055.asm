; DESCRIPTION: Renders a black line between points (57, 247) and (204, 136).
; PLAN: r0=57(x1), r1=247(y1), r2=204(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 247
LDI r2, 204
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
