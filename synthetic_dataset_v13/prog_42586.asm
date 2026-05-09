; DESCRIPTION: Renders a green line between points (62, 121) and (179, 126).
; PLAN: r0=62(x1), r1=121(y1), r2=179(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 121
LDI r2, 179
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
