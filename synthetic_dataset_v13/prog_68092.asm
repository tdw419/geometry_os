; DESCRIPTION: Renders a black line between points (148, 124) and (381, 131).
; PLAN: r0=148(x1), r1=124(y1), r2=381(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 124
LDI r2, 381
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
