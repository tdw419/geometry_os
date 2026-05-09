; DESCRIPTION: Renders a white line between points (507, 207) and (153, 163).
; PLAN: r0=507(x1), r1=207(y1), r2=153(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 207
LDI r2, 153
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
