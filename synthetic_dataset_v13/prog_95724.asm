; DESCRIPTION: Renders a yellow line between points (99, 110) and (407, 16).
; PLAN: r0=99(x1), r1=110(y1), r2=407(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 110
LDI r2, 407
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
