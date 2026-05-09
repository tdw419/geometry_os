; DESCRIPTION: Renders a magenta line between points (407, 17) and (124, 200).
; PLAN: r0=407(x1), r1=17(y1), r2=124(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 17
LDI r2, 124
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
