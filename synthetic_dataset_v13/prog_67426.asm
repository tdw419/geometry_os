; DESCRIPTION: Renders a white line between points (507, 47) and (223, 72).
; PLAN: r0=507(x1), r1=47(y1), r2=223(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 47
LDI r2, 223
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
