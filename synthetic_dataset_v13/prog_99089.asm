; DESCRIPTION: Renders a yellow line between points (484, 124) and (66, 36).
; PLAN: r0=484(x1), r1=124(y1), r2=66(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 124
LDI r2, 66
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
