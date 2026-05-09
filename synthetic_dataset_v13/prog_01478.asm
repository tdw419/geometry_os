; DESCRIPTION: Renders a cyan line between points (423, 158) and (58, 90).
; PLAN: r0=423(x1), r1=158(y1), r2=58(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 158
LDI r2, 58
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
