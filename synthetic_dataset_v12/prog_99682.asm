; DESCRIPTION: Renders a black line between points (507, 143) and (484, 229).
; PLAN: r0=507(x1), r1=143(y1), r2=484(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 143
LDI r2, 484
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
