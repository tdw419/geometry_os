; DESCRIPTION: Renders a purple line between points (138, 76) and (361, 13).
; PLAN: r0=138(x1), r1=76(y1), r2=361(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 76
LDI r2, 361
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
