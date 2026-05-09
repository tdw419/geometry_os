; DESCRIPTION: Renders a black line between points (423, 27) and (163, 247).
; PLAN: r0=423(x1), r1=27(y1), r2=163(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 27
LDI r2, 163
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
