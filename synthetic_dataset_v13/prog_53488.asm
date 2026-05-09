; DESCRIPTION: Renders a black line between points (463, 36) and (270, 49).
; PLAN: r0=463(x1), r1=36(y1), r2=270(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 36
LDI r2, 270
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
