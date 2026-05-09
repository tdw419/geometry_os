; DESCRIPTION: Renders a yellow line between points (124, 237) and (508, 135).
; PLAN: r0=124(x1), r1=237(y1), r2=508(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 237
LDI r2, 508
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
