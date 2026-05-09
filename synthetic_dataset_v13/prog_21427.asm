; DESCRIPTION: Renders a red line between points (507, 4) and (202, 157).
; PLAN: r0=507(x1), r1=4(y1), r2=202(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 4
LDI r2, 202
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
