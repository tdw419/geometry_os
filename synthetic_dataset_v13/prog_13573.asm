; DESCRIPTION: Renders a black line between points (194, 222) and (247, 226).
; PLAN: r0=194(x1), r1=222(y1), r2=247(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 222
LDI r2, 247
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
