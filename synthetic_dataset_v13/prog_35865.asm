; DESCRIPTION: Renders a yellow line between points (175, 31) and (5, 124).
; PLAN: r0=175(x1), r1=31(y1), r2=5(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 31
LDI r2, 5
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
