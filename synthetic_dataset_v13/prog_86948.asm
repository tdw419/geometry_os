; DESCRIPTION: Renders a black line between points (270, 247) and (250, 153).
; PLAN: r0=270(x1), r1=247(y1), r2=250(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 247
LDI r2, 250
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
