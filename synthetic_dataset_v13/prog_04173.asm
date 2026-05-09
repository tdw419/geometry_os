; DESCRIPTION: Renders a red line between points (355, 148) and (511, 137).
; PLAN: r0=355(x1), r1=148(y1), r2=511(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 148
LDI r2, 511
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
