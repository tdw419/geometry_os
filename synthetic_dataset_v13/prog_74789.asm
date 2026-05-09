; DESCRIPTION: Renders a yellow line between points (8, 207) and (9, 77).
; PLAN: r0=8(x1), r1=207(y1), r2=9(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 207
LDI r2, 9
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
