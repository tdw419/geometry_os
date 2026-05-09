; DESCRIPTION: Renders a yellow line between points (124, 214) and (172, 181).
; PLAN: r0=124(x1), r1=214(y1), r2=172(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 214
LDI r2, 172
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
