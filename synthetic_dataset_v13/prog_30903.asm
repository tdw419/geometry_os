; DESCRIPTION: Renders a black line between points (247, 212) and (359, 112).
; PLAN: r0=247(x1), r1=212(y1), r2=359(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 212
LDI r2, 359
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
