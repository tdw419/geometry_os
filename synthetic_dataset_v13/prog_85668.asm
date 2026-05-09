; DESCRIPTION: Renders a red line between points (151, 223) and (507, 181).
; PLAN: r0=151(x1), r1=223(y1), r2=507(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 223
LDI r2, 507
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
