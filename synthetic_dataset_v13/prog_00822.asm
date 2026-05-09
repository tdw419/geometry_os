; DESCRIPTION: Renders a purple line between points (124, 18) and (305, 234).
; PLAN: r0=124(x1), r1=18(y1), r2=305(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 18
LDI r2, 305
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
