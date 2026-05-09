; DESCRIPTION: Renders a yellow line between points (293, 149) and (124, 96).
; PLAN: r0=293(x1), r1=149(y1), r2=124(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 149
LDI r2, 124
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
