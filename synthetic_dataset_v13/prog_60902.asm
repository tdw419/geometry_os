; DESCRIPTION: Renders a red line between points (211, 53) and (507, 171).
; PLAN: r0=211(x1), r1=53(y1), r2=507(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 53
LDI r2, 507
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
