; DESCRIPTION: Renders a black line between points (53, 38) and (79, 247).
; PLAN: r0=53(x1), r1=38(y1), r2=79(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 38
LDI r2, 79
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
