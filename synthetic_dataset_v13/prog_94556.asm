; DESCRIPTION: Renders a yellow line between points (18, 158) and (101, 192).
; PLAN: r0=18(x1), r1=158(y1), r2=101(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 158
LDI r2, 101
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
