; DESCRIPTION: Renders a black line between points (463, 101) and (192, 162).
; PLAN: r0=463(x1), r1=101(y1), r2=192(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 101
LDI r2, 192
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
