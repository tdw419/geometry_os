; DESCRIPTION: Renders a red line between points (321, 185) and (507, 227).
; PLAN: r0=321(x1), r1=185(y1), r2=507(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 185
LDI r2, 507
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
