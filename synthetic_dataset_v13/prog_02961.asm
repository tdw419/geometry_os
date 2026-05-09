; DESCRIPTION: Renders a purple line between points (194, 208) and (507, 154).
; PLAN: r0=194(x1), r1=208(y1), r2=507(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 208
LDI r2, 507
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
