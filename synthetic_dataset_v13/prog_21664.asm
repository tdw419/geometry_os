; DESCRIPTION: Renders a blue line between points (27, 158) and (67, 154).
; PLAN: r0=27(x1), r1=158(y1), r2=67(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 158
LDI r2, 67
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
