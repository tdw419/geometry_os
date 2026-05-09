; DESCRIPTION: Renders a white line between points (334, 143) and (507, 216).
; PLAN: r0=334(x1), r1=143(y1), r2=507(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 143
LDI r2, 507
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
