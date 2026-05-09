; DESCRIPTION: Renders a purple line between points (507, 68) and (5, 126).
; PLAN: r0=507(x1), r1=68(y1), r2=5(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 68
LDI r2, 5
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
