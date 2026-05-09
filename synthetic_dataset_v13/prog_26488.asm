; DESCRIPTION: Renders a yellow line between points (26, 68) and (12, 77).
; PLAN: r0=26(x1), r1=68(y1), r2=12(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 68
LDI r2, 12
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
