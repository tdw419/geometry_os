; DESCRIPTION: Renders a green line between points (463, 112) and (507, 184).
; PLAN: r0=463(x1), r1=112(y1), r2=507(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 112
LDI r2, 507
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
