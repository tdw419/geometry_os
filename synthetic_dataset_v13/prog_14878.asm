; DESCRIPTION: Renders a black line between points (49, 83) and (2, 177).
; PLAN: r0=49(x1), r1=83(y1), r2=2(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 83
LDI r2, 2
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
