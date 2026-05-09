; DESCRIPTION: Renders a yellow line between points (297, 207) and (161, 126).
; PLAN: r0=297(x1), r1=207(y1), r2=161(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 207
LDI r2, 161
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
