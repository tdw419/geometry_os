; DESCRIPTION: Renders a yellow line between points (268, 177) and (507, 23).
; PLAN: r0=268(x1), r1=177(y1), r2=507(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 177
LDI r2, 507
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
