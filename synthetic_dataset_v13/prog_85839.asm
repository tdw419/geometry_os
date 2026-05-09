; DESCRIPTION: Renders a yellow line between points (36, 196) and (437, 124).
; PLAN: r0=36(x1), r1=196(y1), r2=437(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 196
LDI r2, 437
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
