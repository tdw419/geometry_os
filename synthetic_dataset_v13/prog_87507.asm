; DESCRIPTION: Renders a white line between points (233, 245) and (317, 181).
; PLAN: r0=233(x1), r1=245(y1), r2=317(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 245
LDI r2, 317
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
