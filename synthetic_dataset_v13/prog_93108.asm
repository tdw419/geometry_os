; DESCRIPTION: Renders a yellow line between points (106, 87) and (76, 14).
; PLAN: r0=106(x1), r1=87(y1), r2=76(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 87
LDI r2, 76
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
