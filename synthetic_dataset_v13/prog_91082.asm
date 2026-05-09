; DESCRIPTION: Renders a green line between points (177, 161) and (88, 101).
; PLAN: r0=177(x1), r1=161(y1), r2=88(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 161
LDI r2, 88
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
