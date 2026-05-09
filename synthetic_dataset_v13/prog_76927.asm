; DESCRIPTION: Renders a white line between points (90, 218) and (507, 51).
; PLAN: r0=90(x1), r1=218(y1), r2=507(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 218
LDI r2, 507
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
