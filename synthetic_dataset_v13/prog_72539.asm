; DESCRIPTION: Renders a blue line between points (328, 202) and (339, 179).
; PLAN: r0=328(x1), r1=202(y1), r2=339(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 202
LDI r2, 339
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
