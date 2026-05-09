; DESCRIPTION: Renders a yellow line between points (343, 54) and (260, 18).
; PLAN: r0=343(x1), r1=54(y1), r2=260(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 54
LDI r2, 260
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
